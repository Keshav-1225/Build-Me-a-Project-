<%@ Page Title="Login" Language="VB" AutoEventWireup="false" MasterPageFile="~/Masters/Site.Master" CodeBehind="Login.aspx.vb" Inherits="BuildMeAProject.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main class="mx-auto w-[460px] py-20">

        <div class="rounded-2xl bg-white p-10 shadow-sm ring-1 ring-slate-200">

            <p class="text-center text-sm font-semibold text-blue-600">
                WELCOME BACK
            </p>

            <h1 class="mt-2 text-center text-3xl font-bold tracking-tight">
                Log in to your account
            </h1>

            <!-- FORM -->
            <div class="mt-9 space-y-5">

                <!-- Email -->
                <div>
                    <asp:Label
                        ID="lblEmail"
                        runat="server"
                        Text="Email"
                        CssClass="block text-sm font-semibold text-slate-700">
                    </asp:Label>

                    <asp:TextBox
                        ID="txtEmail"
                        runat="server"
                        TextMode="Email"
                        CssClass="mt-2 w-full rounded-xl border border-slate-300 px-4 py-3 font-normal outline-none focus:border-blue-500"
                        placeholder="you@example.com">
                    </asp:TextBox>
                </div>


                <!-- Password -->
                <div>
                    <asp:Label
                        ID="lblPassword"
                        runat="server"
                        Text="Password"
                        CssClass="block text-sm font-semibold text-slate-700">
                    </asp:Label>

                    <asp:TextBox
                        ID="txtPassword"
                        runat="server"
                        TextMode="Password"
                        CssClass="mt-2 w-full rounded-xl border border-slate-300 px-4 py-3 font-normal outline-none focus:border-blue-500"
                        placeholder="••••••••">
                    </asp:TextBox>
                </div>


                <!-- Remember me + Forgot Password -->
                <div class="flex items-center justify-between text-sm">

                    <label class="flex items-center gap-2 text-slate-600">

                        <asp:CheckBox
                            ID="chkRememberMe"
                            runat="server" />

                        Remember me

                    </label>


                    <asp:HyperLink
                        ID="lnkForgotPassword"
                        runat="server"
                        NavigateUrl="#forgot"
                        CssClass="font-semibold text-blue-600">
                        Forgot password?
                    </asp:HyperLink>

                </div>


                <!-- Login Button -->
                <asp:Button
                    ID="btnLogin"
                    runat="server"
                    Text="Log in"
                    CssClass="w-full rounded-xl bg-blue-600 py-3 text-sm font-semibold text-white hover:bg-blue-700"
                    OnClick="btnLogin_Click" />

            </div>


            <!-- OR -->
            <div class="my-7 flex items-center gap-3 text-xs text-slate-400">
                <span class="h-px flex-1 bg-slate-200"></span>
                OR CONTINUE WITH
                <span class="h-px flex-1 bg-slate-200"></span>
            </div>


            <!-- Social Login -->
            <div class="grid grid-cols-2 gap-3">

                <asp:Button
                    ID="btnGoogle"
                    runat="server"
                    Text="Google"
                    CssClass="rounded-xl border border-slate-300 py-3 text-sm font-semibold"
                    />

                <asp:Button
                    ID="btnGitHub"
                    runat="server"
                    Text="GitHub"
                    CssClass="rounded-xl border border-slate-300 py-3 text-sm font-semibold"
                    />

            </div>


            <!-- Register -->
            <p class="mt-7 text-center text-sm text-slate-600">

                Don’t have an account?

                <asp:HyperLink
                    ID="lnkRegister"
                    runat="server"
                    NavigateUrl="~/Pages/public/Register.aspx"
                    CssClass="font-semibold text-blue-600">
                    Create one
                </asp:HyperLink>

            </p>
            <p class="mt-7 text-center text-sm text-slate-600">

                <asp:Label ID="errMsgLabel" runat="server" CssClass="text-red-500"></asp:Label>

            </p>

        </div>

    </main>

</asp:Content>