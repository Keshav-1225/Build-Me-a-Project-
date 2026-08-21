<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masters/Site.Master"
    CodeBehind="Register.aspx.vb" Inherits="BuildMeAProject.Register" %>
    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <main class="mx-auto w-[460px] py-16">
            <div class="rounded-2xl bg-white p-10 shadow-sm ring-1 ring-slate-200">

                <p class="text-center text-sm font-semibold text-blue-600">
                    JOIN THE COMMUNITY
                </p>

                <h1 class="mt-2 text-center text-3xl font-bold tracking-tight">
                    Create your account
                </h1>

                <p class="mt-3 text-center text-sm text-slate-600">
                    Start exploring, buying, selling, and building.
                </p>

                <div class="mt-8 space-y-5">
                    <div>
                        <label class="block text-sm font-semibold text-slate-700">
                            Name
                        </label>

                        <asp:TextBox ID="txtName" runat="server"
                            CssClass="mt-2 w-full rounded-xl border border-slate-300 px-4 py-3 font-normal outline-none focus:border-blue-500"
                            placeholder="Your name">
                        </asp:TextBox>
                    </div>

                    <!-- Username -->
                    <div>
                        <label class="block text-sm font-semibold text-slate-700">
                            Username
                        </label>

                        <asp:TextBox ID="txtUsername" runat="server"
                            CssClass="mt-2 w-full rounded-xl border border-slate-300 px-4 py-3 font-normal outline-none focus:border-blue-500"
                            placeholder="Create a username">
                        </asp:TextBox>
                    </div>

                    <!-- Email -->
                    <div>
                        <label class="block text-sm font-semibold text-slate-700">
                            Email
                        </label>

                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"
                            CssClass="mt-2 w-full rounded-xl border border-slate-300 px-4 py-3 font-normal outline-none focus:border-blue-500"
                            placeholder="you@example.com">
                        </asp:TextBox>
                    </div>

                    <!-- Contact -->
                    <div>
                        <label class="block text-sm font-semibold text-slate-700">
                            Contact no
                        </label>

                        <asp:TextBox ID="txtContact" runat="server"
                            CssClass="mt-2 w-full rounded-xl border border-slate-300 px-4 py-3 font-normal outline-none focus:border-blue-500"
                            placeholder="12345 67890">
                        </asp:TextBox>
                    </div>
                    <!-- Password -->
                    <div>
                        <label class="block text-sm font-semibold text-slate-700">
                            Password
                        </label>

                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"
                            CssClass="mt-2 w-full rounded-xl border border-slate-300 px-4 py-3 font-normal outline-none focus:border-blue-500"
                            placeholder="Create a password">
                        </asp:TextBox>
                    </div>

                    <!-- Password -->
                    <div>
                        <label class="block text-sm font-semibold text-slate-700">
                            Confirm Password
                        </label>

                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"
                            CssClass="mt-2 w-full rounded-xl border border-slate-300 px-4 py-3 font-normal outline-none focus:border-blue-500"
                            placeholder="Again type password">
                        </asp:TextBox>
                    </div>
                    <!-- Terms -->
                    <div class="flex gap-2 text-sm text-slate-600">

                        <asp:CheckBox ID="chkTerms" runat="server" />

                        <label for="<%= chkTerms.ClientID %>">
                            I agree to the terms and privacy policy.
                        </label>

                    </div>

                    <!-- Message -->
                    <asp:Label ID="lblMessage" runat="server" CssClass="block text-sm text-red-600">
                    </asp:Label>

                    <!-- Register -->
                    <asp:Button ID="btnRegister" runat="server" Text="Create account"
                        CssClass="w-full rounded-xl bg-blue-600 py-3 text-sm font-semibold text-white hover:bg-blue-700"
                        OnClick="btnRegister_Click" />

                </div>

                <p class="mt-7 text-center text-sm text-slate-600">

                    Already have an account?

                    <a class="font-semibold text-blue-600" href="<%= ResolveUrl("~/Pages/public/Login.aspx") %>">
                        Log in
                    </a>

                </p>
                <p class="mt-7 text-center text-sm text-slate-600">

                    <asp:Label ID="ErrMsgLbl" runat="server"></asp:Label>

                </p>

            </div>
        </main>

    </asp:Content>