<%@ Page Title="About" Language="VB" MasterPageFile="~/Masters/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.vb" Inherits="BuildMeAProject.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="py-16">
        <section class="overflow-hidden rounded-3xl bg-slate-950 px-12 py-16 text-white">
            <div class="grid grid-cols-[1.35fr_0.65fr] items-center gap-14">
                <div>
                    <p class="text-sm font-semibold uppercase tracking-[0.2em] text-blue-300">About Build me a project</p>
                    <h1 id="title" class="mt-4 max-w-3xl text-5xl font-bold tracking-tight">A place to turn ideas into real projects.</h1>
                    <p class="mt-6 max-w-2xl text-lg leading-8 text-slate-300">Build me a project connects people with ideas to creators who can bring them to life. Discover projects, share what you have built, or post a request and collaborate with the community.</p>
                    <div class="mt-9 flex items-center gap-3">
                        <asp:HyperLink ID="lnkExploreProjects" runat="server" NavigateUrl="~/Pages/public/Projects.aspx" CssClass="rounded-xl bg-white px-6 py-3 text-sm font-semibold text-slate-950 transition hover:bg-blue-50">Explore projects</asp:HyperLink>
                        <asp:HyperLink ID="lnkCreateAccount" runat="server" NavigateUrl="~/Pages/public/Register.aspx" CssClass="rounded-xl border border-slate-600 px-6 py-3 text-sm font-semibold text-white transition hover:border-blue-400 hover:text-blue-200">Join the community</asp:HyperLink>
                    </div>
                </div>
            </div>
        </section>

        <section class="grid grid-cols-3 gap-6 py-12" aria-label="What you can do">
            <article class="rounded-2xl border border-slate-200 bg-white p-7 shadow-sm">
                <div class="flex h-11 w-11 items-center justify-center rounded-xl bg-blue-50 text-blue-600"><svg class="h-6 w-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M12 6v12m6-6H6" /></svg></div>
                <h2 class="mt-5 text-lg font-bold text-slate-950">Share your work</h2>
                <p class="mt-2 leading-7 text-slate-600">Give your projects a home and make them easier for the right people to discover.</p>
            </article>
            <article class="rounded-2xl border border-slate-200 bg-white p-7 shadow-sm">
                <div class="flex h-11 w-11 items-center justify-center rounded-xl bg-blue-50 text-blue-600"><svg class="h-6 w-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M4 19.5V8.25A2.25 2.25 0 0 1 6.25 6h11.5A2.25 2.25 0 0 1 20 8.25V19.5l-3.5-2.25-4.5 2.25-4.5-2.25L4 19.5Z" /></svg></div>
                <h2 class="mt-5 text-lg font-bold text-slate-950">Find useful ideas</h2>
                <p class="mt-2 leading-7 text-slate-600">Explore work across categories and find a strong starting point for your next build.</p>
            </article>
            <article class="rounded-2xl border border-slate-200 bg-white p-7 shadow-sm">
                <div class="flex h-11 w-11 items-center justify-center rounded-xl bg-blue-50 text-blue-600"><svg class="h-6 w-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M7.5 8.25h9M7.5 12h6m-8.25 7.5L3 21.75V5.25A2.25 2.25 0 0 1 5.25 3h13.5A2.25 2.25 0 0 1 21 5.25V15a2.25 2.25 0 0 1-2.25 2.25H7.5Z" /></svg></div>
                <h2 class="mt-5 text-lg font-bold text-slate-950">Collaborate openly</h2>
                <p class="mt-2 leading-7 text-slate-600">Post a request, start a conversation, and build better things together.</p>
            </article>
        </section>

        <section class="grid grid-cols-[0.7fr_1.3fr] items-center gap-14 border-t border-slate-200 py-16">
            
            <div class="">
                <p class="text-sm font-semibold uppercase tracking-[0.18em] text-blue-100">Built with curiosity</p>
                <p class="mt-10 text-2xl font-semibold leading-9">Learning, building, and sharing one project at a time.</p>
                <div class="mt-10 flex items-center gap-3 border-t border-white/20 pt-6"><span class="flex h-10 w-10 items-center justify-center rounded-full bg-white/15 text-sm font-bold">KM</span><span class="text-sm font-medium text-blue-100">Keshav Mishra</span></div>
            </div>
            <div>
                <p class="text-sm font-semibold uppercase tracking-[0.2em] text-blue-600">Meet the creator</p>
                <h2 class="mt-3 text-3xl font-bold tracking-tight text-slate-950">Hi, I’m Keshav Mishra.</h2>
                <p class="mt-5 max-w-2xl leading-8 text-slate-600">I am a BCA student at SDJ International College, passionate about learning through practical work and building helpful digital experiences. Build me a project is a space shaped by that curiosity: a community where creators and ideas can meet.</p>
                <asp:HyperLink ID="lnkGitHub" runat="server" NavigateUrl="https://github.com/keshav-1225" Target="_blank" Text="View my GitHub profile ↗" CssClass="mt-7 inline-flex items-center rounded-xl border border-slate-300 bg-white px-5 py-3 text-sm font-semibold text-slate-700 transition hover:border-slate-950 hover:text-slate-950" ToolTip="Visit Keshav Mishra's GitHub profile" />
            </div>
        </section>
    </main>
</asp:Content>
