<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masters/Admin.Master" CodeBehind="Dashboard.aspx.vb" Inherits="BuildMeAProject.Dashboard" %>
<!--ADMIN DASHBOARD FRONTEND-->
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Label
        ID="lblOverview"
        runat="server"
        Text="OVERVIEW"
        CssClass="text-sm font-semibold text-blue-600" />

    <asp:Label
        ID="lblDashboardTitle"
        runat="server"
        Text="Admin dashboard"
        CssClass="mt-2 block text-4xl font-bold" />

    <asp:Panel
        ID="pnlStats"
        runat="server"
        CssClass="mt-8 grid grid-cols-4 gap-5">

        <!-- Users -->
        <asp:Panel
            ID="pnlUsers"
            runat="server"
            CssClass="rounded-2xl bg-slate-950 p-6 text-white">

            <asp:Label
                ID="lblUsersTitle"
                runat="server"
                Text="Users"
                CssClass="text-sm text-slate-300" />

            <asp:Label
                ID="lblUsersCount"
                runat="server"
                Text="248"
                CssClass="mt-3 block text-3xl font-bold" />

        </asp:Panel>

        <!-- Projects -->
        <asp:Panel
            ID="pnlProjects"
            runat="server"
            CssClass="rounded-2xl bg-white p-6 shadow-sm ring-1 ring-slate-200">

            <asp:Label
                ID="lblProjectsTitle"
                runat="server"
                Text="Projects"
                CssClass="text-sm text-slate-500" />

            <asp:Label
                ID="lblProjectsCount"
                runat="server"
                Text="96"
                CssClass="mt-3 block text-3xl font-bold" />

        </asp:Panel>

        <!-- Orders -->
        <asp:Panel
            ID="pnlOrders"
            runat="server"
            CssClass="rounded-2xl bg-white p-6 shadow-sm ring-1 ring-slate-200">

            <asp:Label
                ID="lblOrdersTitle"
                runat="server"
                Text="Orders"
                CssClass="text-sm text-slate-500" />

            <asp:Label
                ID="lblOrdersCount"
                runat="server"
                Text="154"
                CssClass="mt-3 block text-3xl font-bold" />

        </asp:Panel>

        <!-- Pending Reports -->
        <asp:Panel
            ID="pnlPendingReports"
            runat="server"
            CssClass="rounded-2xl bg-white p-6 shadow-sm ring-1 ring-slate-200">

            <asp:Label
                ID="lblPendingReportsTitle"
                runat="server"
                Text="Pending reports"
                CssClass="text-sm text-slate-500" />

            <asp:Label
                ID="lblPendingReportsCount"
                runat="server"
                Text="12"
                CssClass="mt-3 block text-3xl font-bold" />

        </asp:Panel>

    </asp:Panel>


    <!-- Recent Activity + Review -->
    <asp:Panel
        ID="pnlDashboardContent"
        runat="server"
        CssClass="mt-8 grid grid-cols-[1fr_320px] gap-7">

        <!-- Recent Activity -->
        <asp:Panel
            ID="pnlRecentActivity"
            runat="server"
            CssClass="rounded-2xl bg-white p-7 shadow-sm ring-1 ring-slate-200">

            <asp:Panel
                ID="pnlActivityHeader"
                runat="server"
                CssClass="flex justify-between">

                <asp:Label
                    ID="lblRecentActivity"
                    runat="server"
                    Text="Recent activity"
                    CssClass="text-xl font-bold" />

                <asp:HyperLink
                    ID="lnkViewOrders"
                    runat="server"
                    Text="View orders"
                    NavigateUrl="~/Pages/admin/Orders.aspx"
                    CssClass="text-sm font-semibold text-blue-600" />

            </asp:Panel>


            <asp:Panel
                ID="pnlActivities"
                runat="server"
                CssClass="mt-5 space-y-5 text-sm">

                <!-- Activity 1 -->
                <asp:Panel
                    ID="pnlActivity1"
                    runat="server"
                    CssClass="border-b border-slate-100 pb-4">

                    <asp:Label
                        ID="lblActivity1"
                        runat="server">
                        <strong>Alex Johnson</strong> purchased Smart study planner
                    </asp:Label>

                    <asp:Label
                        ID="lblActivity1Time"
                        runat="server"
                        Text="Today, 10:24 AM"
                        CssClass="mt-1 block text-slate-500" />

                </asp:Panel>


                <!-- Activity 2 -->
                <asp:Panel
                    ID="pnlActivity2"
                    runat="server"
                    CssClass="border-b border-slate-100 pb-4">

                    <asp:Label
                        ID="lblActivity2"
                        runat="server">
                        <strong>Priya Sharma</strong> published a new project
                    </asp:Label>

                    <asp:Label
                        ID="lblActivity2Time"
                        runat="server"
                        Text="Yesterday"
                        CssClass="mt-1 block text-slate-500" />

                </asp:Panel>


                <!-- Activity 3 -->
                <asp:Panel
                    ID="pnlActivity3"
                    runat="server">

                    <asp:Label
                        ID="lblActivity3"
                        runat="server"
                        Text="A report was filed for Project C" />

                    <asp:Label
                        ID="lblActivity3Time"
                        runat="server"
                        Text="Yesterday"
                        CssClass="mt-1 block text-slate-500" />

                </asp:Panel>

            </asp:Panel>

        </asp:Panel>


        <!-- Requires Review -->
        <asp:Panel
            ID="pnlRequiresReview"
            runat="server"
            CssClass="rounded-2xl bg-slate-950 p-7 text-white">

            <asp:Label
                ID="lblReviewTitle"
                runat="server"
                Text="REQUIRES REVIEW"
                CssClass="text-sm font-semibold text-blue-300" />

            <asp:Label
                ID="lblReviewCount"
                runat="server"
                Text="12 pending reports"
                CssClass="mt-3 block text-3xl font-bold" />

            <asp:Label
                ID="lblReviewDescription"
                runat="server"
                Text="Review reports, hide content, or take action on accounts."
                CssClass="mt-3 block text-sm leading-6 text-slate-300" />

            <asp:HyperLink
                ID="lnkViewReports"
                runat="server"
                Text="View reports"
                NavigateUrl="~/Pages/admin/Reports.aspx"
                CssClass="mt-6 block rounded-xl bg-white py-3 text-center text-sm font-semibold text-slate-950" />

        </asp:Panel>

    </asp:Panel>

</asp:Content>