import React from "react";

export default function PaymnetSuccessPage() {
  return (
    <div>
      <div className="mt-5 p-5 container" style={{ height: "100vh" }}>
        <h2 className="mt-4">Payment Transaction Successful</h2>
        <hr />
        <h5 className="mt-4">
          Thank you for choosing CineVision. Your payment has been completed.
          Your ticket details have been sent to your email address.
        </h5>

        <h5 className="pt-3">
          As the CineVision Family, we wish you a pleasant viewing.
        </h5>
      </div>
    </div>
  );
}
