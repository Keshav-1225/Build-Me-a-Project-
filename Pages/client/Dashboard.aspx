<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masters/Client.Master" CodeBehind="Dashboard.aspx.vb" Inherits="BuildMeAProject.Dashboard2" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<!-- CLIENT DASHBOARD FRONTEND -->
    <asp:Panel ID="pnlMain" runat="server" CssClass="py-12">

        <!-- Header -->
        <asp:Label
            ID="lblDashboardType"
            runat="server"
            Text="CLIENT DASHBOARD"
            CssClass="text-sm font-semibold text-blue-600" />

        <asp:Label
            runat="server"
            Text="Welcome back, "
            CssClass="mt-2 block text-4xl font-bold tracking-tight" ID="WelcomeLabel" />

        <asp:Label
            ID="lblDescription"
            runat="server"
            Text="Find projects you might be interested in and keep your work moving."
            CssClass="mt-3 block text-slate-600" />


        <!-- Statistics -->
        <asp:Panel
            ID="pnlStatistics"
            runat="server"
            CssClass="mt-9 grid grid-cols-4 gap-5">

            <!-- Purchases -->
            <asp:Panel
                ID="pnlPurchases"
                runat="server"
                CssClass="rounded-2xl bg-white p-6 shadow-sm ring-1 ring-slate-200">

                <asp:Label
                    ID="lblPurchasesTitle"
                    runat="server"
                    Text="Purchases"
                    CssClass="text-sm font-semibold text-slate-500" />

                <asp:Label
                    ID="lblPurchasesCount"
                    runat="server"
                    Text="08"
                    CssClass="mt-3 block text-3xl font-bold" />

            </asp:Panel>


            <!-- My Requests -->
            <asp:Panel
                ID="pnlRequests"
                runat="server"
                CssClass="rounded-2xl bg-white p-6 shadow-sm ring-1 ring-slate-200">

                <asp:Label
                    ID="lblRequestsTitle"
                    runat="server"
                    Text="My requests"
                    CssClass="text-sm font-semibold text-slate-500" />

                <asp:Label
                    ID="lblRequestsCount"
                    runat="server"
                    Text="03"
                    CssClass="mt-3 block text-3xl font-bold" />

            </asp:Panel>


            <!-- New Pitches -->
            <asp:Panel
                ID="pnlPitches"
                runat="server"
                CssClass="rounded-2xl bg-white p-6 shadow-sm ring-1 ring-slate-200">

                <asp:Label
                    ID="lblPitchesTitle"
                    runat="server"
                    Text="New pitches"
                    CssClass="text-sm font-semibold text-slate-500" />

                <asp:Label
                    ID="lblPitchesCount"
                    runat="server"
                    Text="12"
                    CssClass="mt-3 block text-3xl font-bold" />

            </asp:Panel>


            <!-- Unread Messages -->
            <asp:Panel
                ID="pnlMessages"
                runat="server"
                CssClass="rounded-2xl bg-white p-6 shadow-sm ring-1 ring-slate-200">

                <asp:Label
                    ID="lblMessagesTitle"
                    runat="server"
                    Text="Unread messages"
                    CssClass="text-sm font-semibold text-slate-500" />

                <asp:Label
                    ID="lblMessagesCount"
                    runat="server"
                    Text="04"
                    CssClass="mt-3 block text-3xl font-bold" />

            </asp:Panel>

        </asp:Panel>


        <!-- Recently Viewed + Quick Action -->
        <asp:Panel
            ID="pnlDashboardContent"
            runat="server"
            CssClass="mt-10 grid grid-cols-[1fr_330px] gap-7">


            <!-- Recently Viewed -->
            <asp:Panel
                ID="pnlRecentlyViewed"
                runat="server">

                <asp:Panel
                    ID="pnlRecentlyViewedHeader"
                    runat="server"
                    CssClass="flex items-center justify-between">

                    <asp:Label
                        ID="lblRecentlyViewed"
                        runat="server"
                        Text="Recently viewed"
                        CssClass="text-2xl font-bold" />

                    <asp:HyperLink
                        ID="lnkExploreProjects"
                        runat="server"
                        Text="Explore projects →"
                        NavigateUrl="~/Pages/public/Projects.aspx"
                        CssClass="text-sm font-semibold text-blue-600" />

                </asp:Panel>


                <!-- Project Cards -->
                <asp:Panel
                    ID="pnlProjectCards"
                    runat="server"
                    CssClass="mt-5 grid grid-cols-2 gap-5">


                    <!-- Project 1 -->
                    <asp:Panel
                        ID="pnlProject1"
                        runat="server"
                        CssClass="overflow-hidden rounded-2xl bg-white shadow-sm ring-1 ring-slate-200">

                        <asp:Panel
                            ID="pnlProject1Image"
                            runat="server"
                            CssClass="h-32 bg-gradient-to-br from-violet-500 via-blue-500 to-cyan-400" />

                        <asp:Panel
                            ID="pnlProject1Details"
                            runat="server"
                            CssClass="p-5">

                            <asp:Label
                                ID="lblProject1Name"
                                runat="server"
                                Text="Smart study planner"
                                CssClass="font-bold" />

                            <asp:Label
                                ID="lblProject1Tech"
                                runat="server"
                                Text="AI · React"
                                CssClass="mt-2 block text-sm text-slate-600" />

                            <asp:Label
                                ID="lblProject1Price"
                                runat="server"
                                Text="₹499"
                                CssClass="mt-4 block font-bold" />

                        </asp:Panel>

                    </asp:Panel>


                    <!-- Project 2 -->
                    <asp:Panel
                        ID="pnlProject2"
                        runat="server"
                        CssClass="overflow-hidden rounded-2xl bg-white shadow-sm ring-1 ring-slate-200">

                        <asp:Panel
                            ID="pnlProject2Image"
                            runat="server"
                            CssClass="h-32 bg-gradient-to-br from-emerald-500 via-teal-500 to-cyan-500" />

                        <asp:Panel
                            ID="pnlProject2Details"
                            runat="server"
                            CssClass="p-5">

                            <asp:Label
                                ID="lblProject2Name"
                                runat="server"
                                Text="Creator portfolio kit"
                                CssClass="font-bold" />

                            <asp:Label
                                ID="lblProject2Tech"
                                runat="server"
                                Text="Web · JavaScript"
                                CssClass="mt-2 block text-sm text-slate-600" />

                            <asp:Label
                                ID="lblProject2Price"
                                runat="server"
                                Text="₹399"
                                CssClass="mt-4 block font-bold" />

                        </asp:Panel>

                    </asp:Panel>

                </asp:Panel>

            </asp:Panel>


            <!-- Quick Action -->
            <asp:Panel
                ID="pnlQuickAction"
                runat="server"
                CssClass="rounded-2xl bg-slate-950 p-7 text-white">

                <asp:Label
                    ID="lblQuickActionTitle"
                    runat="server"
                    Text="QUICK ACTION"
                    CssClass="text-sm font-semibold text-blue-300" />

                <asp:Label
                    ID="lblProjectIdea"
                    runat="server"
                    Text="Have a project idea?"
                    CssClass="mt-2 block text-xl font-bold" />

                <asp:Label
                    ID="lblQuickActionDescription"
                    runat="server"
                    Text="Share it with our developer community and start receiving pitches."
                    CssClass="mt-3 block text-sm leading-6 text-slate-300" />

                <asp:HyperLink
                    ID="lnkCreateRequest"
                    runat="server"
                    Text="Create request"
                    NavigateUrl="~/Pages/client/PostRequest.aspx"
                    CssClass="mt-6 block rounded-xl bg-white px-4 py-3 text-center text-sm font-semibold text-slate-950" />

                <asp:HyperLink
                    ID="lnkViewRequests"
                    runat="server"
                    Text="View my requests"
                    NavigateUrl="~/Pages/client/MyRequests.aspx"
                    CssClass="mt-3 block text-center text-sm font-semibold text-blue-300" />

            </asp:Panel>

        </asp:Panel>

    </asp:Panel>

</asp:Content>
