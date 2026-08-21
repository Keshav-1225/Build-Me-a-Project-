<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masters/Seller.Master" CodeBehind="Dashboard.aspx.vb" Inherits="BuildMeAProject.Dashboard1" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Dashboard Header -->
    <asp:Label
        ID="lblDashboardType"
        runat="server"
        Text="SELLER DASHBOARD"
        CssClass="text-sm font-semibold text-blue-600" />

    <asp:Label
        ID="lblWelcome"
        runat="server"
        Text="Welcome back, Priya"
        CssClass="mt-2 block text-4xl font-bold" />

    <asp:Label
        ID="lblDescription"
        runat="server"
        Text="A quick look at your projects and marketplace activity."
        CssClass="mt-3 block text-slate-600" />


    <!-- Statistics -->
    <asp:Panel
        ID="pnlStatistics"
        runat="server"
        CssClass="mt-8 grid grid-cols-4 gap-5">

        <!-- Projects -->
        <asp:Panel
            ID="pnlProjects"
            runat="server"
            CssClass="rounded-2xl bg-slate-950 p-6 text-white">

            <asp:Label
                ID="lblProjectsTitle"
                runat="server"
                Text="Projects"
                CssClass="text-sm text-slate-300" />

            <asp:Label
                ID="lblProjectsCount"
                runat="server"
                Text="12"
                CssClass="mt-3 block text-3xl font-bold" />

        </asp:Panel>


        <!-- Sales -->
        <asp:Panel
            ID="pnlSales"
            runat="server"
            CssClass="rounded-2xl bg-white p-6 shadow-sm ring-1 ring-slate-200">

            <asp:Label
                ID="lblSalesTitle"
                runat="server"
                Text="Sales"
                CssClass="text-sm text-slate-500" />

            <asp:Label
                ID="lblSalesCount"
                runat="server"
                Text="14"
                CssClass="mt-3 block text-3xl font-bold" />

        </asp:Panel>


        <!-- Earnings -->
        <asp:Panel
            ID="pnlEarnings"
            runat="server"
            CssClass="rounded-2xl bg-white p-6 shadow-sm ring-1 ring-slate-200">

            <asp:Label
                ID="lblEarningsTitle"
                runat="server"
                Text="Earnings"
                CssClass="text-sm text-slate-500" />

            <asp:Label
                ID="lblEarnings"
                runat="server"
                Text="₹12,400"
                CssClass="mt-3 block text-3xl font-bold" />

        </asp:Panel>


        <!-- Open Requests -->
        <asp:Panel
            ID="pnlOpenRequests"
            runat="server"
            CssClass="rounded-2xl bg-white p-6 shadow-sm ring-1 ring-slate-200">

            <asp:Label
                ID="lblOpenRequestsTitle"
                runat="server"
                Text="Open requests"
                CssClass="text-sm text-slate-500" />

            <asp:Label
                ID="lblOpenRequestsCount"
                runat="server"
                Text="13"
                CssClass="mt-3 block text-3xl font-bold" />

        </asp:Panel>

    </asp:Panel>


    <!-- Projects + Sales -->
    <asp:Panel
        ID="pnlMainContent"
        runat="server"
        CssClass="mt-9 grid grid-cols-2 gap-7">


        <!-- My Projects -->
        <asp:Panel
            ID="pnlMyProjects"
            runat="server"
            CssClass="rounded-2xl bg-white p-7 shadow-sm ring-1 ring-slate-200">

            <asp:Panel
                ID="pnlProjectsHeader"
                runat="server"
                CssClass="flex justify-between">

                <asp:Label
                    ID="lblMyProjects"
                    runat="server"
                    Text="My projects"
                    CssClass="text-xl font-bold" />

                <asp:HyperLink
                    ID="lnkViewProjects"
                    runat="server"
                    Text="View all"
                    NavigateUrl="~/Pages/seller/MyProjects.aspx"
                    CssClass="text-sm font-semibold text-blue-600" />

            </asp:Panel>


            <!-- Project List -->
            <asp:Panel
                ID="pnlProjectList"
                runat="server"
                CssClass="mt-5 space-y-4 text-sm">

                <!-- Project 1 -->
                <asp:Panel
                    ID="pnlProject1"
                    runat="server"
                    CssClass="flex justify-between border-b border-slate-100 pb-4">

                    <asp:Label
                        ID="lblProject1"
                        runat="server"
                        Text="Smart study planner"
                        CssClass="font-semibold" />

                    <asp:Label
                        ID="lblProject1Status"
                        runat="server"
                        Text="Published"
                        CssClass="text-emerald-700" />

                </asp:Panel>


                <!-- Project 2 -->
                <asp:Panel
                    ID="pnlProject2"
                    runat="server"
                    CssClass="flex justify-between border-b border-slate-100 pb-4">

                    <asp:Label
                        ID="lblProject2"
                        runat="server"
                        Text="Habit tracker"
                        CssClass="font-semibold" />

                    <asp:Label
                        ID="lblProject2Status"
                        runat="server"
                        Text="Published"
                        CssClass="text-emerald-700" />

                </asp:Panel>


                <!-- Project 3 -->
                <asp:Panel
                    ID="pnlProject3"
                    runat="server"
                    CssClass="flex justify-between">

                    <asp:Label
                        ID="lblProject3"
                        runat="server"
                        Text="Finance dashboard"
                        CssClass="font-semibold" />

                    <asp:Label
                        ID="lblProject3Status"
                        runat="server"
                        Text="Hidden"
                        CssClass="text-slate-500" />

                </asp:Panel>

            </asp:Panel>


            <!-- Add Project -->
            <asp:HyperLink
                ID="lnkAddProject"
                runat="server"
                Text="+ Add project"
                NavigateUrl="~/Pages/seller/AddProject.aspx"
                CssClass="mt-6 inline-block rounded-xl bg-blue-600 px-5 py-3 text-sm font-semibold text-white" />

        </asp:Panel>


        <!-- Recent Sales -->
        <asp:Panel
            ID="pnlRecentSales"
            runat="server"
            CssClass="rounded-2xl bg-white p-7 shadow-sm ring-1 ring-slate-200">

            <asp:Panel
                ID="pnlSalesHeader"
                runat="server"
                CssClass="flex justify-between">

                <asp:Label
                    ID="lblRecentSales"
                    runat="server"
                    Text="Recent sales"
                    CssClass="text-xl font-bold" />

                <asp:HyperLink
                    ID="lnkViewSales"
                    runat="server"
                    Text="View all"
                    NavigateUrl="~/Pages/seller/Sales.aspx"
                    CssClass="text-sm font-semibold text-blue-600" />

            </asp:Panel>


            <!-- Sales List -->
            <asp:Panel
                ID="pnlSalesList"
                runat="server"
                CssClass="mt-5 space-y-4 text-sm">

                <!-- Sale 1 -->
                <asp:Panel
                    ID="pnlSale1"
                    runat="server"
                    CssClass="border-b border-slate-100 pb-4">

                    <asp:Label
                        ID="lblSale1Product"
                        runat="server"
                        Text="Smart study planner"
                        CssClass="font-semibold" />

                    <asp:Label
                        ID="lblSale1Price"
                        runat="server"
                        Text="₹499"
                        CssClass="float-right font-semibold" />

                    <asp:Label
                        ID="lblSale1Details"
                        runat="server"
                        Text="Purchased by Alex · Today"
                        CssClass="mt-1 block text-slate-500" />

                </asp:Panel>


                <!-- Sale 2 -->
                <asp:Panel
                    ID="pnlSale2"
                    runat="server">

                    <asp:Label
                        ID="lblSale2Product"
                        runat="server"
                        Text="Habit tracker"
                        CssClass="font-semibold" />

                    <asp:Label
                        ID="lblSale2Price"
                        runat="server"
                        Text="₹699"
                        CssClass="float-right font-semibold" />

                    <asp:Label
                        ID="lblSale2Details"
                        runat="server"
                        Text="Purchased by Isha · Yesterday"
                        CssClass="mt-1 block text-slate-500" />

                </asp:Panel>

            </asp:Panel>

        </asp:Panel>

    </asp:Panel>

</asp:Content>