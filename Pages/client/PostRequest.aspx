<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masters/Client.Master" CodeBehind="PostRequest.aspx.vb" Inherits="BuildMeAProject.PostRequest" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Panel
        ID="pnlMain"
        runat="server"
        CssClass="mx-auto w-[820px] py-14">

        <asp:Panel
            ID="pnlRequestForm"
            runat="server"
            CssClass="rounded-2xl bg-white p-10 shadow-sm ring-1 ring-slate-200">

            <!-- Header -->

            <asp:Label
                ID="lblPageType"
                runat="server"
                Text="PROJECT REQUEST"
                CssClass="text-sm font-semibold text-blue-600" />

            <asp:Label
                ID="lblTitle"
                runat="server"
                Text="Bring your idea to life"
                CssClass="mt-2 block text-3xl font-bold tracking-tight" />

            <asp:Label
                ID="lblDescription"
                runat="server"
                Text="Share what you need and let the right developers come to you."
                CssClass="mt-3 block text-slate-600" />


            <!-- Form -->

            <asp:Panel
                ID="pnlForm"
                runat="server"
                CssClass="mt-9 space-y-6">


                <!-- Topic -->

                <asp:Label
                    ID="lblTopic"
                    runat="server"
                    Text="Topic"
                    AssociatedControlID="txtTopic"
                    CssClass="block text-sm font-semibold text-slate-700" />

                <asp:TextBox
                    ID="txtTopic"
                    runat="server"
                    CssClass="mt-2 w-full rounded-xl border border-slate-300 px-4 py-3 font-normal outline-none focus:border-blue-500"
                    Placeholder="For example, build a portfolio website" />


                <!-- Description -->

                <asp:Label
                    ID="lblProjectDescription"
                    runat="server"
                    Text="Description"
                    AssociatedControlID="txtProjectDescription"
                    CssClass="block text-sm font-semibold text-slate-700" />

                <asp:TextBox
                    ID="txtProjectDescription"
                    runat="server"
                    TextMode="MultiLine"
                    CssClass="mt-2 h-36 w-full resize-none rounded-xl border border-slate-300 px-4 py-3 font-normal outline-none focus:border-blue-500"
                    Placeholder="Describe your requirements, features, and any important details." />


                <!-- Tech Stack + Budget -->

                <asp:Panel
                    ID="pnlTechBudget"
                    runat="server"
                    CssClass="grid grid-cols-2 gap-6">

                    <!-- Tech Stack -->

                    <asp:Panel ID="pnlTechStack" runat="server">

                        <asp:Label
                            ID="lblTechStack"
                            runat="server"
                            Text="Tech stack"
                            AssociatedControlID="txtTechStack"
                            CssClass="block text-sm font-semibold text-slate-700" />

                        <asp:TextBox
                            ID="txtTechStack"
                            runat="server"
                            CssClass="mt-2 w-full rounded-xl border border-slate-300 px-4 py-3 font-normal outline-none focus:border-blue-500"
                            Placeholder="React, Python, Flutter..." />

                    </asp:Panel>


                    <!-- Budget -->

                    <asp:Panel ID="pnlBudget" runat="server">

                        <asp:Label
                            ID="lblBudget"
                            runat="server"
                            Text="Budget"
                            AssociatedControlID="txtBudget"
                            CssClass="block text-sm font-semibold text-slate-700" />

                        <asp:TextBox
                            ID="txtBudget"
                            runat="server"
                            TextMode="Number"
                            CssClass="mt-2 w-full rounded-xl border border-slate-300 px-4 py-3 font-normal outline-none focus:border-blue-500"
                            Placeholder="5000" />

                    </asp:Panel>

                </asp:Panel>


                <!-- Preferred Completion Date -->

                <asp:Label
                    ID="lblCompletionDate"
                    runat="server"
                    Text="Preferred completion date"
                    AssociatedControlID="txtCompletionDate"
                    CssClass="block text-sm font-semibold text-slate-700" />

                <asp:TextBox
                    ID="txtCompletionDate"
                    runat="server"
                    TextMode="Date"
                    CssClass="mt-2 w-full rounded-xl border border-slate-300 px-4 py-3 font-normal outline-none focus:border-blue-500" />


                <!-- Buttons -->

                <asp:Panel
                    ID="pnlButtons"
                    runat="server"
                    CssClass="flex items-center gap-4 border-t border-slate-100 pt-7">

                    <asp:Button
                        ID="btnPostRequest"
                        runat="server"
                        Text="Post request"
                        CssClass="rounded-xl bg-blue-600 px-6 py-3 text-sm font-semibold text-white hover:bg-blue-700"
                        OnClick="btnPostRequest_Click" />

                    <asp:HyperLink
                        ID="lnkCancel"
                        runat="server"
                        Text="Cancel"
                        NavigateUrl="~/Pages/client/Requests.aspx"
                        CssClass="text-sm font-semibold text-slate-600 hover:text-slate-950" />

                    <br />
                    <asp:Label ID="ErrLabel" runat="server"></asp:Label>

                </asp:Panel>

            </asp:Panel>

        </asp:Panel>

    </asp:Panel>

</asp:Content>
