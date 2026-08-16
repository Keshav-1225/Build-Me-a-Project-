<%@ Page Title="Contact" Language="VB" MasterPageFile="~/Masters/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.vb" Inherits="BuildMeAProject.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title" class="max-w-3xl">
        <p class="text-sm font-semibold uppercase tracking-[0.2em] text-blue-600">Get in touch</p>
        <h2 id="title" class="mt-2 text-3xl font-bold tracking-tight text-slate-900"><%: Title %></h2>
        <p class="mt-6 text-lg leading-8 text-slate-600">Your contact page.</p>

        <address class="mt-8 rounded-xl border border-slate-200 bg-slate-50 p-6 not-italic leading-7 text-slate-700 shadow-sm">
            One Microsoft Way<br />
            Redmond, WA 98052-6399<br />
            <abbr class="font-semibold no-underline" title="Phone">P:</abbr>
            425.555.0100
        </address>

        <address class="mt-6 not-italic leading-7 text-slate-700">
            <strong>Support:</strong> <a class="font-medium text-blue-600 hover:text-blue-800 hover:underline" href="mailto:Support@example.com">Support@example.com</a><br />
            <strong>Marketing:</strong> <a class="font-medium text-blue-600 hover:text-blue-800 hover:underline" href="mailto:Marketing@example.com">Marketing@example.com</a>
        </address>
    </main>
</asp:Content>
