<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masters/Admin.Master" CodeBehind="AddProject.aspx.vb" Inherits="BuildMeAProject.AddProject" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!--ADMIN ADD PROJECT-->
    <asp:Panel
        ID="pnlMain"
        runat="server"
        CssClass="mx-auto w-[760px]">

        <!-- Header -->

        <asp:Label
            ID="lblPageType"
            runat="server"
            Text="NEW LISTING"
            CssClass="text-sm font-semibold text-blue-600" />

        <asp:Label
            ID="lblPageTitle"
            runat="server"
            Text="Add a project"
            CssClass="mt-2 block text-4xl font-bold" />


        <!-- Form -->

        <asp:Panel
            ID="pnlForm"
            runat="server"
            CssClass="mt-8 rounded-2xl bg-white p-8 shadow-sm ring-1 ring-slate-200">

            <asp:Panel
                ID="pnlFields"
                runat="server"
                CssClass="space-y-5">


                <!-- Project Title -->

                <asp:Panel ID="pnlTitle" runat="server">

                    <asp:Label
                        ID="lblProjectTitle"
                        runat="server"
                        Text="Project title"
                        AssociatedControlID="txtProjectTitle"
                        CssClass="block text-sm font-semibold" />

                    <asp:TextBox
                        ID="txtProjectTitle"
                        runat="server"
                        CssClass="mt-2 w-full rounded-xl border border-slate-300 px-4 py-3 font-normal"
                        Placeholder="Give your project a clear name" />

                </asp:Panel>


                <!-- Description -->

                <asp:Panel ID="pnlDescription" runat="server">

                    <asp:Label
                        ID="lblDescription"
                        runat="server"
                        Text="Description"
                        AssociatedControlID="txtDescription"
                        CssClass="block text-sm font-semibold" />

                    <asp:TextBox
                        ID="txtDescription"
                        runat="server"
                        TextMode="MultiLine"
                        CssClass="mt-2 h-32 w-full rounded-xl border border-slate-300 px-4 py-3 font-normal"
                        Placeholder="Explain what the project does and what buyers receive." />

                </asp:Panel>


                <!-- Category + Price -->

                <asp:Panel
                    ID="pnlCategoryPrice"
                    runat="server"
                    CssClass="grid grid-cols-2 gap-5">


                    <!-- Category -->

                    <asp:Panel ID="pnlCategory" runat="server">

                        <asp:Label
                            ID="lblCategory"
                            runat="server"
                            Text="Category"
                            AssociatedControlID="ddlCategory"
                            CssClass="text-sm font-semibold" />

                        <asp:DropDownList
                            ID="ddlCategory"
                            runat="server"
                            CssClass="mt-2 w-full rounded-xl border border-slate-300 px-4 py-3 font-normal">

                            <asp:ListItem
                                Text="Choose a category"
                                Value=""
                                Selected="True" />

                            <asp:ListItem
                                Text="Web development"
                                Value="Web development" />

                            <asp:ListItem
                                Text="Python"
                                Value="Python" />

                            <asp:ListItem
                                Text="Mobile development"
                                Value="Mobile development" />

                            <asp:ListItem
                                Text="AI / ML"
                                Value="AI / ML" />

                            <asp:ListItem
                                Text="Java"
                                Value="Java" />

                            <asp:ListItem
                                Text="Other"
                                Value="Other" />

                        </asp:DropDownList>

                    </asp:Panel>


                    <!-- Price -->

                    <asp:Panel ID="pnlPrice" runat="server">

                        <asp:Label
                            ID="lblPrice"
                            runat="server"
                            Text="Price"
                            AssociatedControlID="txtPrice"
                            CssClass="text-sm font-semibold" />

                        <asp:TextBox
                            ID="txtPrice"
                            runat="server"
                            TextMode="Number"
                            CssClass="mt-2 w-full rounded-xl border border-slate-300 px-4 py-3 font-normal"
                            Placeholder="499" />

                    </asp:Panel>

                </asp:Panel>


                <!-- Technology Stack -->

                <asp:Panel ID="pnlTechStack" runat="server">

                    <asp:Label
                        ID="lblTechStack"
                        runat="server"
                        Text="Technology stack"
                        AssociatedControlID="txtTechStack"
                        CssClass="block text-sm font-semibold" />

                    <asp:TextBox
                        ID="txtTechStack"
                        runat="server"
                        CssClass="mt-2 w-full rounded-xl border border-slate-300 px-4 py-3 font-normal"
                        Placeholder="React, Flask, VB.NET..." />

                </asp:Panel>

                <!-- Github URL -->

                <asp:Panel ID="pnlGithubURL" runat="server">

                    <asp:Label
                        ID="lblGithubURL"
                        runat="server"
                        Text="Github URL"
                        AssociatedControlID="txtTechStack"
                        CssClass="block text-sm font-semibold" />

                    <asp:TextBox
                        ID="txtGitHubURL"
                        runat="server"
                        CssClass="mt-2 w-full rounded-xl border border-slate-300 px-4 py-3 font-normal"
                        Placeholder="https://www.github.com/..." />

                </asp:Panel>


                <!-- Setup Instructions -->

                <asp:Panel ID="pnlSetupInstructions" runat="server">

                    <asp:Label
                        ID="lblSetupInstructions"
                        runat="server"
                        Text="Setup instructions"
                        AssociatedControlID="txtSetupInstructions"
                        CssClass="block text-sm font-semibold" />

                    <asp:TextBox
                        ID="txtSetupInstructions"
                        runat="server"
                        TextMode="MultiLine"
                        CssClass="mt-2 h-28 w-full rounded-xl border border-slate-300 px-4 py-3 font-normal"
                        Placeholder="Give buyers clear setup instructions." />

                </asp:Panel>


                <!-- Screenshots -->

                <asp:Panel
                    ID="pnlScreenshots"
                    runat="server"
                    CssClass="rounded-xl border border-dashed border-slate-300 p-6 text-center">

                    <asp:Label
                        ID="lblScreenshotsTitle"
                        runat="server"
                        Text="Project screenshots"
                        CssClass="block text-sm font-semibold text-slate-700" />

                    <asp:Label
                        ID="lblScreenshotsDescription"
                        runat="server"
                        Text="Upload screenshots or project previews. You can select multiple images."
                        CssClass="mt-2 block text-sm text-slate-500" />

                    <asp:FileUpload
                        ID="fuScreenshots"
                        runat="server"
                        AllowMultiple="true"
                        CssClass="mt-4 block w-full text-sm text-slate-500" />

                    <asp:Label
                        ID="lblScreenshotInfo"
                        runat="server"
                        Text="Supported: JPG, JPEG, PNG, WEBP"
                        CssClass="mt-3 block text-xs text-slate-400" />

                </asp:Panel>


                <!-- Message -->

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="block text-sm font-medium" />


                <!-- Publish -->

                <asp:Button
                    ID="btnPublishProject"
                    runat="server"
                    Text="Publish project"
                    CssClass="rounded-xl bg-blue-600 px-6 py-3 text-sm font-semibold text-white hover:bg-blue-700"
                    OnClick="btnPublishProject_Click" />

                <br />
                <asp:Label ID="ErrLabel" runat="server"></asp:Label>

            </asp:Panel>

        </asp:Panel>

    </asp:Panel>

</asp:Content>