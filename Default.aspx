<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Masters/Site.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.vb" Inherits="BuildMeAProject._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <section class="mx-auto max-w-4xl py-28 text-center">
            <h1 class="mt-6 text-6xl font-extrabold tracking-tight text-slate-950">Build. Buy. Sell. Learn.</h1>
            <p class="mx-auto mt-6 max-w-2xl text-lg leading-8 text-slate-600">Find the perfect project, or bring your project idea to life with a community of skilled creators.</p>
            <form class="mx-auto mt-9 flex max-w-2xl items-center rounded-2xl border border-slate-200 bg-white p-2 shadow-lg shadow-slate-200/70" action="#featured-projects" method="get">
                <div class="flex w-full justify-around">
                <label class="sr-only" for="project-search">Search projects</label>
                <asp:Image ImageUrl="~/Assets/Images/search.gif" runat="server" Width="40px"/>
                <input id="project-search" class="min-w-0 flex-1 border-0 bg-transparent px-3 py-3 text-slate-900 outline-none placeholder:text-slate-400" type="search" placeholder="Search projects" />
                <button class="rounded-xl bg-blue-600 px-4 py-3 text-sm font-semibold text-white transition hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2" type="submit">Search</button>
                    </div>
            </form>
            <div class="mt-7 flex justify-center gap-3">
                <a class="rounded-xl bg-slate-950 px-6 py-3 text-sm font-semibold text-white shadow-sm transition hover:bg-slate-800" href="<%= ResolveUrl("~/Pages/public/Projects.aspx") %>">Explore projects</a>
                <a class="rounded-xl border border-slate-300 bg-white px-6 py-3 text-sm font-semibold text-slate-700 shadow-sm transition hover:border-blue-600 hover:text-blue-600" href="<%= ResolveUrl("~/Pages/client/PostRequest.aspx") %>">Post a request</a>
            </div>
        </section>

        <section id="categories" class="border-y border-slate-200 py-16">
            <div class="flex items-end justify-between">
                <div>
                    <p class="text-sm font-semibold text-blue-600">DISCOVER BY CATEGORY</p>
                    <h2 class="mt-2 text-3xl font-bold tracking-tight text-slate-950">Popular categories</h2>
                </div>
                <a class="text-sm font-semibold text-blue-600 hover:text-blue-800" href="#featured-projects">Explore now <span aria-hidden="true">&rarr;</span></a>
            </div>
            <div class="mt-8 flex flex-wrap gap-3">
                <a class="rounded-full bg-white px-5 py-3 text-sm font-semibold text-slate-700 ring-1 ring-slate-200 transition hover:bg-blue-600 hover:text-white hover:ring-blue-600" href="#featured-projects">Web</a>
                <a class="rounded-full bg-white px-5 py-3 text-sm font-semibold text-slate-700 ring-1 ring-slate-200 transition hover:bg-blue-600 hover:text-white hover:ring-blue-600" href="#featured-projects">App</a>
                <a class="rounded-full bg-white px-5 py-3 text-sm font-semibold text-slate-700 ring-1 ring-slate-200 transition hover:bg-blue-600 hover:text-white hover:ring-blue-600" href="#featured-projects">Python</a>
                <a class="rounded-full bg-white px-5 py-3 text-sm font-semibold text-slate-700 ring-1 ring-slate-200 transition hover:bg-blue-600 hover:text-white hover:ring-blue-600" href="#featured-projects">AI / ML</a>
                <a class="rounded-full bg-white px-5 py-3 text-sm font-semibold text-slate-700 ring-1 ring-slate-200 transition hover:bg-blue-600 hover:text-white hover:ring-blue-600" href="#featured-projects">Java</a>
            </div>
        </section>

        <section id="featured-projects" class="py-20">
            <div class="flex items-end justify-between gap-6">
                <div>
                    <p class="text-sm font-semibold text-blue-600">HAND-PICKED FOR YOU</p>
                    <h2 class="mt-2 text-3xl font-bold tracking-tight text-slate-950">Featured projects</h2>
                </div>
                <a class="text-sm font-semibold text-blue-600 hover:text-blue-800" href="<%= ResolveUrl("~/Pages/public/Projects.aspx") %>">View all projects <span aria-hidden="true">&rarr;</span></a>
            </div>
            <div class="mt-8 grid grid-cols-3 gap-6">
                <article class="overflow-hidden rounded-2xl bg-white shadow-sm ring-1 ring-slate-200 transition hover:-translate-y-1 hover:shadow-lg">
                    <div class="flex aspect-[16/9] items-end bg-gradient-to-br from-violet-500 via-blue-500 to-cyan-400 p-5"><span class="rounded-lg bg-white/20 px-3 py-1.5 text-xs font-semibold text-white backdrop-blur">AI powered</span></div>
                    <div class="p-6"><div class="flex items-start justify-between gap-3"><h3 class="font-bold text-slate-950">Smart study planner</h3><span class="whitespace-nowrap text-sm font-bold text-slate-950">₹499</span></div><p class="mt-3 text-sm leading-6 text-slate-600">Plan coursework, stay on track, and get smart study recommendations.</p><div class="mt-5 flex items-center justify-between"><span class="text-sm font-medium text-amber-500">★ 3.7</span><span class="text-xs font-medium text-slate-500">AI · React</span></div></div>
                </article>
                <article class="overflow-hidden rounded-2xl bg-white shadow-sm ring-1 ring-slate-200 transition hover:-translate-y-1 hover:shadow-lg">
                    <div class="flex aspect-[16/9] items-end bg-gradient-to-br from-emerald-500 via-teal-500 to-cyan-500 p-5"><span class="rounded-lg bg-white/20 px-3 py-1.5 text-xs font-semibold text-white backdrop-blur">Open source</span></div>
                    <div class="p-6"><div class="flex items-start justify-between gap-3"><h3 class="font-bold text-slate-950">Creator portfolio kit</h3><span class="whitespace-nowrap text-sm font-bold text-slate-950">₹399</span></div><p class="mt-3 text-sm leading-6 text-slate-600">A polished portfolio template to help creators showcase their best work.</p><div class="mt-5 flex items-center justify-between"><span class="text-sm font-medium text-amber-500">★ 4.2</span><span class="text-xs font-medium text-slate-500">Web · JavaScript</span></div></div>
                </article>
                <article class="overflow-hidden rounded-2xl bg-white shadow-sm ring-1 ring-slate-200 transition hover:-translate-y-1 hover:shadow-lg">
                    <div class="flex aspect-[16/9] items-end bg-gradient-to-br from-orange-400 via-rose-500 to-fuchsia-600 p-5"><span class="rounded-lg bg-white/20 px-3 py-1.5 text-xs font-semibold text-white backdrop-blur">New release</span></div>
                    <div class="p-6"><div class="flex items-start justify-between gap-3"><h3 class="font-bold text-slate-950">Expense tracker</h3><span class="whitespace-nowrap text-sm font-bold text-slate-950">₹299</span></div><p class="mt-3 text-sm leading-6 text-slate-600">Keep personal finances simple with thoughtful charts and useful insights.</p><div class="mt-5 flex items-center justify-between"><span class="text-sm font-medium text-amber-500">★ 4.5</span><span class="text-xs font-medium text-slate-500">App · Python</span></div></div>
                </article>
            </div>
        </section>

        <section id="project-requests" class="mb-4 rounded-3xl bg-slate-950 px-12 py-16 text-center text-white">
            <p class="text-sm font-semibold text-blue-300">CAN'T FIND THE RIGHT FIT?</p>
            <h2 class="mx-auto mt-3 max-w-2xl text-4xl font-bold tracking-tight">Still didn’t find what you are looking for?</h2>
            <p class="mx-auto mt-5 max-w-2xl leading-7 text-slate-300">Post a request with your requirements and let the community build it for you.</p>
            <a class="mt-8 inline-flex rounded-xl bg-white px-6 py-3 text-sm font-semibold text-slate-950 transition hover:bg-blue-50" href="<%= ResolveUrl("~/Pages/client/PostRequest.aspx") %>">Post a request</a>
        </section>
    </main>
</asp:Content>
