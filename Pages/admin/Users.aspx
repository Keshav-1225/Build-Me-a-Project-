<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masters/Admin.Master"
    CodeBehind="Users.aspx.vb" Inherits="BuildMeAProject.Users" %>
    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

        <!-- Header -->

        <asp:Panel ID="pnlHeader" runat="server" CssClass="flex justify-between">

            <asp:Panel ID="pnlTitle" runat="server">

                <asp:Label ID="lblPageType" runat="server" Text="ACCOUNTS"
                    CssClass="text-sm font-semibold text-blue-600" />

                <asp:Label ID="lblPageTitle" runat="server" Text="Users" CssClass="mt-2 block text-4xl font-bold" />

            </asp:Panel>


            <!-- Header Actions -->

            <asp:Panel ID="pnlHeaderActions" runat="server" CssClass="flex items-center gap-3">

                <asp:TextBox ID="txtSearch" runat="server"
                    CssClass="w-72 rounded-xl border border-slate-300 px-4 py-3 text-sm"
                    Placeholder="Search name or email" />

                <asp:Button ID="btnSearch" runat="server" Text="Search"
                    CssClass="rounded-xl bg-slate-950 px-5 py-3 text-sm font-semibold text-white hover:bg-slate-800"
                    OnClick="btnSearch_Click" />

                <asp:HyperLink ID="lnkAddUser" runat="server" Text="+ Add User" NavigateUrl="~/Pages/admin/AddUser.aspx"
                    CssClass="rounded-xl bg-blue-600 px-5 py-3 text-sm font-semibold text-white hover:bg-blue-700" />

            </asp:Panel>

        </asp:Panel>


        <!-- Users Table -->

        <asp:Panel ID="pnlUsersTable" runat="server"
            CssClass="mt-8 overflow-hidden rounded-2xl bg-white shadow-sm ring-1 ring-slate-200">

            <table class="w-full text-left text-sm">

                <thead class="bg-slate-50 text-slate-500">

                    <tr>

                        <th class="px-6 py-4">
                            Name
                        </th>

                        <th class="px-6 py-4">
                            Email
                        </th>

                        <th class="px-6 py-4">
                            Status
                        </th>

                        <th class="px-6 py-4">
                            Role
                        </th>

                        <th class="px-6 py-4">
                            Actions
                        </th>

                    </tr>

                </thead>
                <tbody class="divide-y divide-slate-100">
                    <asp:Repeater ID="rptUsers" runat="server" OnItemCommand="rptUsers_ItemCommand">
                        <ItemTemplate>
                            <tr>
                                <td class="px-6 py-5 font-semibold">
                                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("name")%>' />
                                </td>

                                <td class="px-6 py-5">
                                    <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("email") %>' />
                                </td>

                                <td class="px-6 py-5">
                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("status") %>'
                                        CssClass="text-emerald-700" />
                                </td>

                                <td class="px-6 py-5">
                                    <asp:Label ID="lblUser1Role" runat="server" Text='<%# Eval("role") %>' />
                                </td>
                                <td class="px-6 py-5">
                                    <!-- EDIT -->
                                    <asp:ImageButton
                                        ID="EditBtn" 
                                        runat="server" 
                                        ImageUrl="~/Assets/Images/edit.gif"
                                        CommandName="EditUser"
                                        CommandArgument='<%# Eval("ID") %>'
                                        Width="24px" Height="24px"/>
                                    <!-- DELETE -->
                                    <asp:ImageButton
                                        ID="DeleteBtn" 
                                        runat="server" 
                                        ImageUrl="~/Assets/Images/trash-bin.gif"
                                        CommandName="DeleteUser"
                                        CommandArgument='<%# Eval("ID") %>'
                                        Width="24px" Height="24px"
                                        OnClientClick="return confirm('Are you sure you want to delete this user?');" />

                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>



            </table>

        </asp:Panel>


        <!-- Message -->

        <asp:Label ID="lblMessage" runat="server" CssClass="mt-4 block text-sm font-medium" />

    </asp:Content>