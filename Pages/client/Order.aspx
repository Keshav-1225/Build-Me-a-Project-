<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masters/Client.Master" CodeBehind="Order.aspx.vb" Inherits="BuildMeAProject.Order" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Main Container -->
    <asp:Panel
        ID="pnlMain"
        runat="server"
        CssClass="mx-auto w-[940px] py-12">

        <!-- Page Header -->
        <asp:Label
            ID="lblCheckout"
            runat="server"
            Text="SECURE CHECKOUT"
            CssClass="text-sm font-semibold text-blue-600" />

        <asp:Label
            ID="lblTitle"
            runat="server"
            Text="Complete your order"
            CssClass="mt-2 block text-4xl font-bold" />


        <!-- Checkout Grid -->
        <asp:Panel
            ID="pnlCheckout"
            runat="server"
            CssClass="mt-8 grid grid-cols-[1fr_320px] gap-7">


            <!-- Project Section -->
            <asp:Panel
                ID="pnlProject"
                runat="server"
                CssClass="rounded-2xl bg-white p-8 shadow-sm ring-1 ring-slate-200">

                <asp:Label
                    ID="lblProjectHeading"
                    runat="server"
                    Text="Project"
                    CssClass="text-xl font-bold" />

                <asp:Repeater ID="rptProject" runat="server">
                    <ItemTemplate>

                    <asp:Panel
                        ID="pnlProjectInfo"
                        runat="server"
                        CssClass="mt-5 flex items-center justify-between rounded-xl bg-slate-50 p-5">

                        <asp:Panel
                            ID="pnlProjectDetails"
                            runat="server">

                            <asp:Label
                                ID="lblProjectName"
                                runat="server"
                                Text='<%# Eval("title")%>'
                                CssClass="font-semibold" />

                        </asp:Panel>

                        <asp:Panel
                            ID="pnlPriceNDelete"
                            runat="server"
                            CssClass="flex gap-3 items-center justify-center">

                        <asp:Label
                            ID="lblPrice"
                            runat="server"
                            Text='<%# Eval("price") %>'
                            CssClass="font-bold" />

                        <asp:ImageButton
                            ID="removeProjectBtn"
                            runat="server"
                            CommandName="DeleteProject"
                            CommandArgument='<%# Eval("projectID") %>'
                            ImageUrl="~/Assets/Images/trash-bin.gif"
                            ToolTip="Remove from cart"
                            Width="30px"
                            Height="30px"
                            OnClientClick="return confirm('Are you sure you wanna remove this project?')"/>

                        </asp:Panel>
                    </asp:Panel>
                    </ItemTemplate>
                </asp:Repeater>
                <!-- Project Information -->


                <!-- Payment Method -->
                <asp:Label
                    ID="lblPaymentHeading"
                    runat="server"
                    Text="Payment method"
                    CssClass="mt-8 block text-xl font-bold" />

                <asp:Panel
                    ID="pnlPaymentMethod"
                    runat="server"
                    CssClass="mt-4 flex items-center gap-3 rounded-xl border border-blue-500 bg-blue-50 p-4 text-sm font-semibold">

                    <asp:RadioButton
                        ID="rbSimulatedPayment"
                        runat="server"
                        GroupName="PaymentMethod"
                        Text="Simulated payment for prototype"
                        Checked="true" />

                </asp:Panel>
                <asp:Label 
                    ID="lblMessage"
                    runat="server"
                    text=""
                    CssClass="text-red-500"/>
            </asp:Panel>


            <!-- Order Summary -->
            <asp:Panel
                ID="pnlOrderSummary"
                runat="server"
                CssClass="h-fit rounded-2xl bg-white p-7 shadow-sm ring-1 ring-slate-200">

                <asp:Label
                    ID="lblSummaryHeading"
                    runat="server"
                    Text="Order summary"
                    CssClass="text-xl font-bold" />


                <!-- Coupon -->
                <asp:Panel
                    ID="pnlCoupon"
                    runat="server"
                    CssClass="mt-5 flex gap-2">

                    <asp:TextBox
                        ID="txtCoupon"
                        runat="server"
                        placeholder="Coupon code"
                        CssClass="min-w-0 flex-1 rounded-xl border border-slate-300 px-3 py-2 text-sm" />

                    <asp:Button
                        ID="btnApplyCoupon"
                        runat="server"
                        Text="Apply"
                        CssClass="rounded-xl border border-slate-300 px-3 text-sm font-semibold"
                        CausesValidation="false" />

                </asp:Panel>


                <!-- Price Details -->
                <asp:Panel
                    ID="pnlPriceDetails"
                    runat="server"
                    CssClass="mt-6 space-y-3 text-sm">

                    <!-- Subtotal -->
                    <asp:Panel
                        ID="pnlSubtotal"
                        runat="server"
                        CssClass="flex justify-between">

                        <asp:Label
                            ID="lblSubtotalTitle"
                            runat="server"
                            Text="Subtotal"
                            CssClass="text-slate-500" />

                        <asp:Label
                            ID="lblSubtotal"
                            runat="server"
                            Text="₹499" />

                    </asp:Panel>


                    <!-- Discount -->
                    <asp:Panel
                        ID="pnlDiscount"
                        runat="server"
                        CssClass="flex justify-between">

                        <asp:Label
                            ID="lblDiscountTitle"
                            runat="server"
                            Text="Discount"
                            CssClass="text-slate-500" />

                        <asp:Label
                            ID="lblDiscount"
                            runat="server"
                            Text="₹0" />

                    </asp:Panel>


                    <!-- Total -->
                    <asp:Panel
                        ID="pnlTotal"
                        runat="server"
                        CssClass="flex justify-between border-t border-slate-100 pt-4 text-lg font-bold">

                        <asp:Label
                            ID="lblTotalTitle"
                            runat="server"
                            Text="Total" />

                        <asp:Label
                            ID="lblTotal"
                            runat="server"
                            Text="₹499" />

                    </asp:Panel>

                </asp:Panel>


                <!-- Proceed To Payment -->
                <asp:Button
                    ID="btnProceedToPayment"
                    runat="server"
                    Text="Proceed to Payment"
                    OnClick="btnProceedToPayment_Click"
                    CssClass="mt-6 block rounded-xl bg-blue-600 px-5 py-3 text-center text-sm font-semibold text-white" />


                <!-- Cancel Transaction -->
                <asp:HyperLink
                    ID="lnkCancelTransaction"
                    runat="server"
                    Text="Cancel transaction"
                    NavigateUrl="~/Pages/public/ProjectDetails.aspx?id=1"
                    CssClass="mt-4 block text-center text-sm font-semibold text-slate-600" />

            </asp:Panel>

        </asp:Panel>

    </asp:Panel>

</asp:Content>