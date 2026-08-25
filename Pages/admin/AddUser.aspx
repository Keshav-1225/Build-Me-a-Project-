<%@ Page Title="Add User" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masters/Admin.Master" CodeBehind="AddUser.aspx.vb" Inherits="BuildMeAProject.AddUser" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- HEADER -->
    <asp:Panel ID="pnlMain" runat="server" CssClass="mx-auto w-[760px]">
        <asp:Label 
            ID="lblPageType"
            runat="server" 
            Text="ACCOUNT MANAGEMENT"
            CssClass="text-sm font-semibold text-blue-600" />

        <asp:Label
            ID="lblPageTitle"
            runat="server" 
            Text="Add a user" 
            CssClass="mt-2 block text-4xl font-bold" />

        <asp:Label 
            ID="lblPageDescription" 
            runat="server" 
            Text="Create an account and assign the access level that user should have." 
            CssClass="mt-3 block text-sm text-slate-500" />

        <!-- ADD USER FORM -->
        <asp:Panel 
            ID="pnlForm" 
            runat="server" 
            CssClass="mt-8 rounded-2xl bg-white p-8 shadow-sm ring-1 ring-slate-200">
            
            <asp:ValidationSummary 
                ID="vsAddUser" 
                runat="server" 
                ValidationGroup="AddUser" 
                CssClass="mb-5 block rounded-xl border border-rose-200 bg-rose-50 px-4 py-3 text-sm text-rose-700" />

            <asp:Panel
                ID="pnlFields"
                runat="server"
                CssClass="space-y-5">
                
                <!-- FULL NAME -->
                <asp:Panel ID="pnlName" runat="server">
                    <asp:Label
                        ID="lblFullName" 
                        runat="server" 
                        Text="Full name" 
                        AssociatedControlID="txtFullName" 
                        CssClass="block text-sm font-semibold" />
                    
                    <asp:TextBox 
                        ID="txtFullName" 
                        runat="server" 
                        Placeholder="Enter the user's full name" 
                        CssClass="mt-2 w-full rounded-xl border border-slate-300 px-4 py-3" />
                    
                    <asp:RequiredFieldValidator 
                        ID="rfvFullName" 
                        runat="server" 
                        ControlToValidate="txtFullName" 
                        ValidationGroup="AddUser" 
                        Display="Dynamic" 
                        Text="Full name is required." 
                        CssClass="mt-2 block text-sm text-rose-600" />
                </asp:Panel>
                
                <!-- USERNAME -->
                <asp:Panel ID="pnlUserName" runat="server">
                    <asp:Label
                        ID="lblUserName" 
                        runat="server" 
                        Text="Username" 
                        AssociatedControlID="txtFullName" 
                        CssClass="block text-sm font-semibold" />
                    
                    <asp:TextBox 
                        ID="txtusername" 
                        runat="server" 
                        Placeholder="Give user a username" 
                        CssClass="mt-2 w-full rounded-xl border border-slate-300 px-4 py-3" />
                    
                    <asp:RequiredFieldValidator 
                        ID="rfvusername" 
                        runat="server" 
                        ControlToValidate="txtFullName" 
                        ValidationGroup="AddUser" 
                        Display="Dynamic" 
                        Text="Full name is required." 
                        CssClass="mt-2 block text-sm text-rose-600" />
                </asp:Panel>

                <!-- Email -->
                <asp:Panel ID="pnlEmail" runat="server">
                    <asp:Label 
                        ID="lblEmail" 
                        runat="server" 
                        Text="Email address" 
                        AssociatedControlID="txtEmail" 
                        CssClass="block text-sm font-semibold" />
                    
                    <asp:TextBox 
                        ID="txtEmail" 
                        runat="server" 
                        TextMode="Email" 
                        Placeholder="name@example.com" 
                        CssClass="mt-2 w-full rounded-xl border border-slate-300 px-4 py-3" />
                    
                    <asp:RequiredFieldValidator 
                        ID="rfvEmail" 
                        runat="server" 
                        ControlToValidate="txtEmail" 
                        ValidationGroup="AddUser" 
                        Display="Dynamic" 
                        Text="Email address is required." 
                        CssClass="mt-2 block text-sm text-rose-600" />
                    
                    <asp:RegularExpressionValidator 
                        ID="revEmail" 
                        runat="server" 
                        ControlToValidate="txtEmail" 
                        ValidationGroup="AddUser" 
                        Display="Dynamic" 
                        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" 
                        Text="Enter a valid email address." 
                        CssClass="mt-2 block text-sm text-rose-600" />
                </asp:Panel>

                <!-- Contact -->
                <asp:Panel ID="pnlContact" runat="server">
                    <asp:Label 
                        ID="lblContact" 
                        runat="server" 
                        Text="Contact number" 
                        AssociatedControlID="txtContact" 
                        CssClass="block text-sm font-semibold" />

                    <asp:TextBox 
                        ID="txtContact" 
                        runat="server" 
                        TextMode="Phone" 
                        Placeholder="9876543210" 
                        MaxLength="10"
                        CssClass="mt-2 w-full rounded-xl border border-slate-300 px-4 py-3" />

                    <asp:RequiredFieldValidator 
                        ID="rfvContact" 
                        runat="server" 
                        ControlToValidate="txtContact" 
                        ValidationGroup="AddUser" 
                        Display="Dynamic" 
                        Text="Contact number is required." 
                        CssClass="mt-2 block text-sm text-rose-600" />

                    <asp:RegularExpressionValidator 
                        ID="revContact" 
                        runat="server" 
                        ControlToValidate="txtContact" 
                        ValidationGroup="AddUser" 
                        Display="Dynamic" 
                        ValidationExpression="^[0-9]{10}$" 
                        Text="Contact number must contain exactly 10 digits." 
                        CssClass="mt-2 block text-sm text-rose-600" />
                </asp:Panel>
                <!-- PASSWORD -->
                <asp:Panel ID="pnlPasswordRow" runat="server" CssClass="grid grid-cols-2 gap-5">
                    <asp:Panel ID="pnlPassword" runat="server">
                        <asp:Label 
                            ID="lblPassword" 
                            runat="server" 
                            Text="Temporary password" 
                            AssociatedControlID="txtPassword" 
                            CssClass="block text-sm font-semibold" />
                        
                        <asp:TextBox 
                            ID="txtPassword" 
                            runat="server" 
                            TextMode="Password" 
                            CssClass="mt-2 w-full rounded-xl border border-slate-300 px-4 py-3" 
                            Placeholder="At least 8 characters" />
                        
                        <asp:RequiredFieldValidator 
                            ID="rfvPassword" 
                            runat="server" 
                            ControlToValidate="txtPassword" 
                            ValidationGroup="AddUser" 
                            Display="Dynamic" 
                            Text="Password is required." 
                            CssClass="mt-2 block text-sm text-rose-600" />
                        
                        <asp:RegularExpressionValidator 
                            ID="revPassword" 
                            runat="server" 
                            ControlToValidate="txtPassword" 
                            ValidationGroup="AddUser" 
                            Display="Dynamic" 
                            ValidationExpression="^.{8,}$" Text="Use at least 8 characters." 
                            CssClass="mt-2 block text-sm text-rose-600" />
                    </asp:Panel>

                    <asp:Panel ID="pnlConfirmPassword" runat="server">
                        <asp:Label
                            ID="lblConfirmPassword"
                            runat="server"
                            Text="Confirm password" 
                            AssociatedControlID="txtConfirmPassword"
                            CssClass="block text-sm font-semibold" />
                        
                        <asp:TextBox 
                            ID="txtConfirmPassword" 
                            runat="server" 
                            TextMode="Password" 
                            CssClass="mt-2 w-full rounded-xl border border-slate-300 px-4 py-3"
                            Placeholder="Re-enter the password" />
                        
                        <asp:RequiredFieldValidator 
                            ID="rfvConfirmPassword" 
                            runat="server" 
                            ControlToValidate="txtConfirmPassword" 
                            ValidationGroup="AddUser" 
                            Display="Dynamic" 
                            Text="Please confirm the password." 
                            CssClass="mt-2 block text-sm text-rose-600" />
                        
                        <asp:CompareValidator 
                            ID="cvPassword" 
                            runat="server" 
                            ControlToValidate="txtConfirmPassword" 
                            ControlToCompare="txtPassword" 
                            ValidationGroup="AddUser" 
                            Display="Dynamic" 
                            Text="Passwords do not match." 
                            CssClass="mt-2 block text-sm text-rose-600" />
                    </asp:Panel>
                </asp:Panel>

                <!-- ROLE -->
                <asp:Panel ID="pnlRole" runat="server">
                    <asp:Label 
                        ID="lblRole" 
                        runat="server" 
                        Text="Account role" 
                        AssociatedControlID="ddlRole" 
                        CssClass="block text-sm font-semibold" />
                    
                    <asp:DropDownList ID="ddlRole" runat="server" CssClass="mt-2 w-full rounded-xl border border-slate-300 px-4 py-3">
                        <asp:ListItem Text="Choose a role" Value="" Selected="True" />
                        <asp:ListItem Text="Client" Value="Client" />
                        <asp:ListItem Text="Seller" Value="Seller" />
                        <asp:ListItem Text="Administrator" Value="Admin" />
                    </asp:DropDownList>
                    
                    <asp:RequiredFieldValidator 
                        ID="rfvRole" 
                        runat="server" 
                        ControlToValidate="ddlRole" 
                        InitialValue="" 
                        ValidationGroup="AddUser" 
                        Display="Dynamic" 
                        Text="Choose an account role." 
                        CssClass="mt-2 block text-sm text-rose-600" />
                    
                    <asp:Label 
                        ID="lblRoleHint" 
                        runat="server" 
                        Text="The selected role determines the pages and actions this user can access." 
                        CssClass="mt-2 block text-xs text-slate-500" />
                </asp:Panel>

               <!-- <asp:Panel ID="pnlStatus" runat="server" CssClass="rounded-xl bg-slate-50 p-4">
     <asp:CheckBox ID="chkIsActive" runat="server" Text="Activate this account immediately" Checked="true" CssClass="text-sm font-medium text-slate-700" />
     <asp:Label ID="lblStatusHint" runat="server" Text="Inactive users cannot sign in until an administrator activates their account." CssClass="mt-2 block text-xs text-slate-500" />
 </asp:Panel>-->

                <asp:Label ID="lblMessage" runat="server" CssClass="block text-sm font-medium" />

                <!-- BUTTONS -->
                <asp:Panel ID="pnlActions" runat="server" CssClass="flex items-center gap-3 pt-2">
                    <asp:Button
                        ID="btnCreateUser" 
                        runat="server" Text="Create user" 
                        ValidationGroup="AddUser" 
                        CssClass="rounded-xl bg-blue-600 px-6 py-3 text-sm font-semibold text-white hover:bg-blue-700"   />
                    
                    <asp:HyperLink 
                        ID="lnkCancel" 
                        runat="server" 
                        Text="Cancel" 
                        NavigateUrl="~/Pages/admin/Users.aspx" 
                        CssClass="rounded-xl border border-slate-300 px-6 py-3 text-sm font-semibold text-slate-700 hover:bg-slate-50" />
                </asp:Panel>
            </asp:Panel>
        </asp:Panel>
    </asp:Panel>
</asp:Content>
