<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masters/Client.Master" CodeBehind="Payment.aspx.vb" Inherits="BuildMeAProject.Payment" %>
<asp:Content ID="BodyContent"
    ContentPlaceHolderID="MainContent"
    runat="server">
    <style>
        .container{
            display:flex;
            width:100vw;
            height:70vh;
            justify-items: center;
            justify-content:center;
            align-items: center;

        }
    </style>
    <main class="py-12">
        <div class="mx-auto max-w-4xl container">
            <div class="mb-8 text-center ">
                <div class="mx-auto mb-4 flex h-12 w-12 items-center justify-center rounded-full bg-blue-100 text-xl text-blue-700">&#128274;</div>
                <p class="text-sm font-semibold uppercase tracking-[0.18em] text-blue-600">Secure checkout</p>
                <h1 class="mt-2 text-3xl font-bold tracking-tight text-slate-950">Complete your payment</h1>
                <p class="mt-3 text-slate-600">Review your payment details and continue securely with Razorpay.</p>
                <asp:Label 
                    ID="lblMessage"
                    runat="server"
                    Text=""
                    CssClass="mt-4 block text-sm text-red-600" />
            </div>
            <% If Not String.IsNullOrWhiteSpace(RazorpayOrderId) Then %>
            <div class="rounded-2xl bg-white p-8 text-center shadow-sm ring-1 ring-slate-200">
                <p class="text-sm text-slate-500">Order #<%= CheckoutOrderId %></p>
                <p class="mt-2 text-3xl font-bold text-slate-950">₹<%= PaymentAmount.ToString("0.00") %></p>
                <button type="button" onclick="startRazorpayPayment()" class="mt-6 rounded-xl bg-blue-600 px-6 py-3 text-sm font-semibold text-white">Pay securely with Razorpay</button>
            </div>
            <% End If %>

        </div>
    </main>

    <% If Not String.IsNullOrWhiteSpace(RazorpayOrderId) Then %>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <script>
        function addHiddenField(form, name, value) {
            var input = document.createElement("input");
            input.type = "hidden";
            input.name = name;
            input.value = value;
            form.appendChild(input);
        }

        function startRazorpayPayment() {
            var options = {
                key: "<%= HttpUtility.JavaScriptStringEncode(RazorpayKeyId) %>",
                amount: <%= AmountInPaise %>,
                currency: "INR",
                name: "Build Me A Project",
                description: "Order #<%= CheckoutOrderId %>",
                order_id: "<%= HttpUtility.JavaScriptStringEncode(RazorpayOrderId) %>",
                handler: function (response) {
                    var form = document.forms[0];
                    addHiddenField(form, "paymentAction", "verify");
                    addHiddenField(form, "razorpay_payment_id", response.razorpay_payment_id);
                    addHiddenField(form, "razorpay_order_id", response.razorpay_order_id);
                    addHiddenField(form, "razorpay_signature", response.razorpay_signature);
                    form.submit();
                },
                theme: { color: "#2563eb" }
            };

            var razorpay = new Razorpay(options);
            razorpay.open();
        }

        window.addEventListener("load", startRazorpayPayment, { once: true });
    </script>
    <% End If %>
</asp:Content>
