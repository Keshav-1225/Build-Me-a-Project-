<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masters/Client.Master" CodeBehind="OrderConfirmation.aspx.vb" Inherits="BuildMeAProject.OrderConfirmation" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Panel
        ID="pnlMain"
        runat="server"
        CssClass="mx-auto w-[700px] py-20 text-center">

        <asp:Panel
            ID="pnlSuccess"
            runat="server"
            CssClass="rounded-3xl bg-white p-12 shadow-sm ring-1 ring-slate-200">


            <!-- Success Icon -->

            <asp:Panel
                ID="pnlSuccessIcon"
                runat="server"
                CssClass="mx-auto flex h-16 w-16 items-center justify-center rounded-full bg-emerald-50 text-3xl text-emerald-700">

                <asp:Label
                    ID="lblSuccessIcon"
                    runat="server"
                    Text="✓" />

            </asp:Panel>


            <!-- Payment Status -->

            <asp:Label
                ID="lblPaymentStatus"
                runat="server"
                Text="PAYMENT SUCCESSFUL"
                CssClass="mt-6 block text-sm font-semibold text-blue-600" />


            <!-- Title -->

            <asp:Label
                ID="lblTitle"
                runat="server"
                Text="Your order is confirmed."
                CssClass="mt-2 block text-4xl font-bold" />


            <!-- Description -->

            <asp:Label
                ID="lblDescription"
                runat="server"
                Text="Smart study planner is now available in your purchases. A receipt has been created for order #BM-101."
                CssClass="mx-auto mt-4 block max-w-md leading-7 text-slate-600" />


            <!-- Buttons -->

            <asp:Panel
                ID="pnlActions"
                runat="server"
                CssClass="mt-8 flex justify-center gap-3">

                <asp:HyperLink
                    ID="lnkViewOrder"
                    runat="server"
                    Text="View order details"
                    NavigateUrl="~/Pages/client/PurchaseDetails.aspx?id=101"
                    CssClass="rounded-xl bg-blue-600 px-6 py-3 text-sm font-semibold text-white" />

                <asp:HyperLink
                    ID="lnkExploreProjects"
                    runat="server"
                    Text="Explore projects"
                    NavigateUrl="~/Pages/public/Projects.aspx"
                    CssClass="rounded-xl border border-slate-300 px-6 py-3 text-sm font-semibold text-slate-700" />

            </asp:Panel>

        </asp:Panel>

    </asp:Panel>

</asp:Content>
