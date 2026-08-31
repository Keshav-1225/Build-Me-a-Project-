<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masters/Admin.Master" CodeBehind="ProjectDetails.aspx.vb" Inherits="BuildMeAProject.ProjectDetails" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <!-- Back to Projects -->
    <asp:HyperLink
        ID="lnkBackToProjects"
        runat="server"
        Text="← Projects"
        NavigateUrl="~/Pages/admin/Projects.aspx"
        CssClass="text-sm font-semibold text-blue-600" />

    <!-- Project Details -->
    <asp:Panel
        ID="pnlProjectDetails"
        runat="server"
        CssClass="mt-6 max-w-[820px] rounded-2xl bg-white p-8 shadow-sm ring-1 ring-slate-200">

        <!-- Project Number -->

        <!-- Project Title -->
        <asp:Label
            ID="lblProjectTitle"
            runat="server"
            Text="Smart study planner"
            CssClass="mt-2 block text-3xl font-bold" />

        <!-- Description -->
        <asp:Label
            ID="lblProjectDescription"
            runat="server"
            Text="An AI-assisted planner for coursework and study sessions."
            CssClass="mt-3 block leading-7 text-slate-600" />

        <!-- Project Information -->
        <asp:Panel
            ID="pnlProjectInfo"
            runat="server"
            CssClass="mt-7 grid grid-cols-3 border-y border-slate-100 py-5 text-sm">

            <!-- Seller -->
            <asp:Panel
                ID="pnlSeller"
                runat="server">
                <asp:Label
                    ID="lblSellerTitle"
                    runat="server"
                    Text="Seller"
                    CssClass="text-slate-500" />

                <asp:Label
                    ID="lblSellerName"
                    runat="server"
                    Text="Priya Sharma"
                    CssClass="mt-1 block font-semibold" />
            </asp:Panel>

            <!-- Price -->
            <asp:Panel
                ID="pnlPrice"
                runat="server">

                <asp:Label
                    ID="lblPriceTitle"
                    runat="server"
                    Text="Price"
                    CssClass="text-slate-500" />

                <asp:Label
                    ID="lblPrice"
                    runat="server"
                    Text="₹499"
                    CssClass="mt-1 block font-semibold" />
            </asp:Panel>

            <!-- Status -->
            <asp:Panel
                ID="pnlStatus"
                runat="server">

                <asp:Label
                    ID="lblStatusTitle"
                    runat="server"
                    Text="Status"
                    CssClass="text-slate-500" />

                <asp:Label
                    ID="lblProjectStatus"
                    runat="server"
                    Text="Visible"
                    CssClass="mt-1 block font-semibold text-emerald-700" />
            </asp:Panel>
        </asp:Panel>

        <!-- Actions -->
        <asp:Panel
            ID="pnlActions"
            runat="server"
            CssClass="mt-7 flex gap-3 items-c">

            <asp:LinkButton
                ID="btnHideProject"
                runat="server"
                Text="Hide project"
                CommandArgument="1"
                OnClick="btnHideProject_Click"
                CausesValidation="false"
                CssClass="rounded-xl border border-slate-300 px-5 py-3 text-sm font-semibold hover:bg-bla" />

            <asp:ImageButton
                ID="DeleteProjectBtn"
                runat="server"
                ImageUrl="~/Assets/Images/trash-bin.gif"
                Height ="30px"    
                Width="30px"
                ToolTip="Delete Project"/>
                
        </asp:Panel>

        <!-- Message -->
        <asp:Label
            ID="lblMessage"
            runat="server"
            CssClass="mt-5 block text-sm font-medium" />
    </asp:Panel>
</asp:Content>