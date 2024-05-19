const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

const stripeModule = require("stripe");

// Credentials
const kStripeProdSecretKey =
  "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";
const kStripeTestSecretKey =
  "sk_test_51LOI2XBzo7KeiEMEvMq1t4V17K7RdiB5CiEFLG0TNRKwde13Sqz7K70y0uM61OGKZyJTzyLsu8K3GQwlDLue4wmL00KlJfUgZo";

const secretKey = (isProd) =>
  isProd ? kStripeProdSecretKey : kStripeTestSecretKey;

/**
 *
 */
exports.initStripePayment = functions
  .region("europe-west1")
  .https.onCall(async (data, context) => {
    if (!context.auth) {
      return "Unauthenticated calls are not allowed.";
    }
    return await initPayment(data, true);
  });

/**
 *
 */
exports.initStripeTestPayment = functions
  .region("europe-west1")
  .https.onCall(async (data, context) => {
    if (!context.auth) {
      return "Unauthenticated calls are not allowed.";
    }
    return await initPayment(data, false);
  });

async function initPayment(data, isProd) {
  try {
    const stripe = new stripeModule.Stripe(secretKey(isProd), {
      apiVersion: "2020-08-27",
    });

    const customers = await stripe.customers.list({
      email: data.email,
      limit: 1,
    });
    var customer = customers.data[0];
    if (!customer) {
      customer = await stripe.customers.create({
        email: data.email,
        ...(data.name && { name: data.name }),
      });
    }

    const ephemeralKey = await stripe.ephemeralKeys.create(
      { customer: customer.id },
      { apiVersion: "2020-08-27" },
    );
    const paymentIntent = await stripe.paymentIntents.create({
      amount: data.amount,
      currency: data.currency,
      customer: customer.id,
      ...(data.description && { description: data.description }),
    });

    return {
      paymentId: paymentIntent.id,
      paymentIntent: paymentIntent.client_secret,
      ephemeralKey: ephemeralKey.secret,
      customer: customer.id,
      success: true,
    };
  } catch (error) {
    console.log(`Error: ${error}`);
    return { success: false, error: userFacingMessage(error) };
  }
}

/**
 * Sanitize the error message for the user.
 */
function userFacingMessage(error) {
  return error.type
    ? error.message
    : "An error occurred, developers have been alerted";
}
exports.onUserDeleted = functions
  .region("europe-west1")
  .auth.user()
  .onDelete(async (user) => {
    let firestore = admin.firestore();
    let userRef = firestore.doc("users/" + user.uid);
    await firestore.collection("users").doc(user.uid).delete();
  });
