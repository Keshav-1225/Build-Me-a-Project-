<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masters/Client.Master" CodeBehind="MyRequests.aspx.vb" Inherits="BuildMeAProject.MyRequests" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Panel
        ID="pnlMain"
        runat="server"
        CssClass="py-14">

        <!-- Page Header -->

        <asp:Panel
            ID="pnlHeader"
            runat="server"
            CssClass="flex items-end justify-between border-b border-slate-200 pb-9">

            <asp:Panel
                ID="pnlHeaderText"
                runat="server">

                <asp:Label
                    ID="lblPageType"
                    runat="server"
                    Text="MY REQUESTS"
                    CssClass="text-sm font-semibold text-blue-600" />

                <asp:Label
                    ID="lblPageTitle"
                    runat="server"
                    Text="Project requests"
                    CssClass="mt-2 block text-4xl font-bold tracking-tight" />

                <asp:Label
                    ID="lblPageDescription"
                    runat="server"
                    Text="Manage the projects you have requested and review developer pitches."
                    CssClass="mt-3 block text-slate-600" />

            </asp:Panel>

        </asp:Panel>


        <!-- Main Content -->

        <asp:Panel
            ID="pnlContent"
            runat="server"
            CssClass="mt-8 grid grid-cols-[1fr_280px] gap-10">


            <!-- Requests List -->

            <asp:Panel
                ID="pnlRequests"
                runat="server"
                CssClass="space-y-5">


                <!-- Request 1 -->

               <asp:Repeater ID="rptRequests" runat="server">

    <ItemTemplate>

        <asp:Panel
            ID="pnlRequest"
            runat="server"
            CssClass="rounded-2xl bg-white p-7 shadow-sm ring-1 ring-slate-200">

            <asp:Panel
                ID="pnlRequestHeader"
                runat="server"
                CssClass="flex items-start justify-between">

                <asp:Panel
                    ID="pnlRequestTitle"
                    runat="server">

                    <asp:Label
                        ID="lblRequestCategory"
                        runat="server"
                        Text='<%# Eval("tech_stack") %>'
                        CssClass="text-sm font-semibold text-blue-600" />

                    <asp:Label
                        ID="lblRequestTitle"
                        runat="server"
                        Text='<%# Eval("title") %>'
                        CssClass="mt-2 block text-xl font-bold" />

                </asp:Panel>

                <asp:Label
                    ID="lblRequestStatus"
                    runat="server"
                    Text='<%# Eval("status") %>'
                    CssClass="rounded-full bg-emerald-50 px-3 py-1 text-sm font-semibold text-emerald-700" />

            </asp:Panel>


            <asp:Label
                ID="lblRequestDescription"
                runat="server"
                Text='<%# Eval("description") %>'
                CssClass="mt-4 block leading-7 text-slate-600" />


            <asp:Panel
                ID="pnlRequestDetails"
                runat="server"
                CssClass="mt-6 flex flex-col gap-4 border-t border-slate-100 pt-5 text-sm lg:flex-row lg:items-center lg:justify-between">

                <asp:Label
                    ID="lblRequestInfo"
                    runat="server"
                    Text='<%# "₹" & Eval("budget") & " budget · Deadline: " & FormatDeadline(Eval("deadline")) %>'
                    CssClass="text-slate-500" />

                <asp:Panel
                    ID="pnlRequestActions"
                    runat="server"
                    CssClass="flex flex-wrap items-center gap-2">

                    <asp:HyperLink
                        ID="lnkPitches"
                        runat="server"
                        Text="Show pitches"
                        NavigateUrl='<%# "~/Pages/client/RequestPitches.aspx?id=" & Eval("ID") %>'
                        CssClass="rounded-lg bg-blue-600 px-4 py-2 font-semibold text-white transition hover:bg-blue-700" />

                    <asp:HyperLink
                        ID="lnkEdit"
                        runat="server"
                        Text="Edit"
                        NavigateUrl='<%# "~/Pages/client/EditRequest.aspx?id=" & Eval("ID") %>'
                        CssClass="rounded-lg border border-slate-300 px-4 py-2 font-semibold text-slate-700 transition hover:border-slate-400 hover:bg-slate-50" />

                </asp:Panel>

            </asp:Panel>

        </asp:Panel>

    </ItemTemplate>

</asp:Repeater>

            </asp:Panel>


            <!-- Sidebar -->

            <asp:Panel
                ID="pnlSummary"
                runat="server"
                CssClass="h-fit rounded-2xl bg-slate-950 p-7 text-white">

                <asp:Label
                    ID="lblSummaryTitle"
                    runat="server"
                    Text="REQUEST SUMMARY"
                    CssClass="text-sm font-semibold text-blue-300" />

                <asp:Label
                    ID="lblTotalRequests"
                    runat="server"
                    Text="1 active request"
                    CssClass="mt-3 block text-2xl font-bold" />

                <asp:Label
                    ID="lblSummaryDescription"
                    runat="server"
                    Text="Keep your requests updated so developers know exactly what you need."
                    CssClass="mt-3 block text-sm leading-6 text-slate-300" />


                <!-- Summary Stats -->

                <asp:Panel
                    ID="pnlSummaryStats"
                    runat="server"
                    CssClass="mt-6 space-y-4 border-t border-slate-800 pt-5">

                    <asp:Panel
                        ID="pnlOpenRequests"
                        runat="server"
                        CssClass="flex justify-between">

                        <asp:Label
                            ID="lblOpenRequests"
                            runat="server"
                            Text="Open"
                            CssClass="text-sm text-slate-400" />

                        <asp:Label
                            ID="lblOpenRequestsCount"
                            runat="server"
                            Text="1"
                            CssClass="text-sm font-semibold text-white" />

                    </asp:Panel>


                    <asp:Panel
                        ID="pnlInProgress"
                        runat="server"
                        CssClass="flex justify-between">

                        <asp:Label
                            ID="lblInProgress"
                            runat="server"
                            Text="In progress"
                            CssClass="text-sm text-slate-400" />

                        <asp:Label
                            ID="lblInProgressCount"
                            runat="server"
                            Text="0"
                            CssClass="text-sm font-semibold text-white" />

                    </asp:Panel>


                    <asp:Panel
                        ID="pnlCompleted"
                        runat="server"
                        CssClass="flex justify-between">

                        <asp:Label
                            ID="lblCompleted"
                            runat="server"
                            Text="Completed"
                            CssClass="text-sm text-slate-400" />

                        <asp:Label
                            ID="lblCompletedCount"
                            runat="server"
                            Text="0"
                            CssClass="text-sm font-semibold text-white" />

                    </asp:Panel>

                </asp:Panel>


                <asp:HyperLink
                    ID="lnkNewRequest"
                    runat="server"
                    Text="+ Create new request"
                    NavigateUrl="~/Pages/client/PostRequest.aspx"
                    CssClass="mt-6 block rounded-xl bg-white py-3 text-center text-sm font-semibold text-slate-950 hover:bg-blue-50" />

            </asp:Panel>

        </asp:Panel>

    </asp:Panel>

</asp:Content>
