<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Masters/Site.Master"
    AutoEventWireup="true" CodeBehind="Default.aspx.vb"
    Inherits="BuildMeAProject._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>

        <!-- ============================================ -->
        <!-- HERO SECTION -->
        <!-- ============================================ -->

        <asp:Panel
            ID="pnlHero"
            runat="server"
            CssClass="mx-auto max-w-4xl py-28 text-center">

            <asp:Label
                ID="lblHeroTitle"
                runat="server"
                Text="Build. Buy. Sell. Learn."
                CssClass="mt-6 block text-6xl font-extrabold tracking-tight text-slate-950" />

            <asp:Label
                ID="lblHeroDescription"
                runat="server"
                Text="Find the perfect project, or bring your project idea to life with a community of skilled creators."
                CssClass="mx-auto mt-6 block max-w-2xl text-lg leading-8 text-slate-600" />


            <!-- Search -->

            <asp:Panel
                ID="pnlSearch"
                runat="server"
                CssClass="mx-auto mt-9 flex max-w-2xl items-center rounded-2xl border border-slate-200 bg-white p-2 shadow-lg shadow-slate-200/70">

                <asp:Image
                    ID="imgSearch"
                    runat="server"
                    ImageUrl="~/Assets/Images/search.gif"
                    Width="40px"
                    AlternateText="Search" />

                <asp:TextBox
                    ID="txtSearch"
                    runat="server"
                    CssClass="min-w-0 flex-1 border-0 bg-transparent px-3 py-3 text-slate-900 outline-none placeholder:text-slate-400"
                    Placeholder="Search projects" />

                <asp:Button
                    ID="btnSearch"
                    runat="server"
                    Text="Search"
                    CssClass="rounded-xl bg-blue-600 px-4 py-3 text-sm font-semibold text-white transition hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2"
                    OnClick="btnSearch_Click" />

            </asp:Panel>


            <!-- Hero Buttons -->

            <asp:Panel
                ID="pnlHeroButtons"
                runat="server"
                CssClass="mt-7 flex justify-center gap-3">

                <asp:HyperLink
                    ID="lnkExploreProjects"
                    runat="server"
                    Text="Explore projects"
                    NavigateUrl="~/Pages/public/Projects.aspx"
                    CssClass="rounded-xl bg-slate-950 px-6 py-3 text-sm font-semibold text-white shadow-sm transition hover:bg-slate-800" />

                <asp:HyperLink
                    ID="lnkPostRequest"
                    runat="server"
                    Text="Post a request"
                    NavigateUrl="~/Pages/public/Login.aspx?returnUrl=/Pages/client/PostRequest.aspx"
                    CssClass="rounded-xl border border-slate-300 bg-white px-6 py-3 text-sm font-semibold text-slate-700 shadow-sm transition hover:border-blue-600 hover:text-blue-600" />

            </asp:Panel>

        </asp:Panel>


        <!-- ============================================ -->
        <!-- CATEGORIES -->
        <!-- ============================================ -->

        <asp:Panel
            ID="pnlCategories"
            runat="server"
            CssClass="border-y border-slate-200 py-16">

            <asp:Panel
                ID="pnlCategoriesHeader"
                runat="server"
                CssClass="flex items-end justify-between">

                <asp:Panel ID="pnlCategoryTitle" runat="server">

                    <asp:Label
                        ID="lblCategorySubtitle"
                        runat="server"
                        Text="DISCOVER BY CATEGORY"
                        CssClass="text-sm font-semibold text-blue-600" />

                    <asp:Label
                        ID="lblCategoryTitle"
                        runat="server"
                        Text="Popular categories"
                        CssClass="mt-2 block text-3xl font-bold tracking-tight text-slate-950" />

                </asp:Panel>

                <asp:HyperLink
                    ID="lnkExploreNow"
                    runat="server"
                    Text="Explore now →"
                    NavigateUrl="#featured-projects"
                    CssClass="text-sm font-semibold text-blue-600 hover:text-blue-800" />

            </asp:Panel>


            <!-- Category Buttons -->

            <asp:Panel
                ID="pnlCategoryButtons"
                runat="server"
                CssClass="mt-8 flex flex-wrap gap-3">

                <asp:HyperLink
                    ID="lnkWebCategory"
                    runat="server"
                    Text="Web"
                    NavigateUrl="~/Pages/public/Projects.aspx?category=web"
                    CssClass="rounded-full bg-white px-5 py-3 text-sm font-semibold text-slate-700 ring-1 ring-slate-200 transition hover:bg-blue-600 hover:text-white hover:ring-blue-600" />

                <asp:HyperLink
                    ID="lnkAppCategory"
                    runat="server"
                    Text="App"
                    NavigateUrl="~/Pages/public/Projects.aspx?category=app"
                    CssClass="rounded-full bg-white px-5 py-3 text-sm font-semibold text-slate-700 ring-1 ring-slate-200 transition hover:bg-blue-600 hover:text-white hover:ring-blue-600" />

                <asp:HyperLink
                    ID="lnkPythonCategory"
                    runat="server"
                    Text="Python"
                    NavigateUrl="~/Pages/public/Projects.aspx?category=python"
                    CssClass="rounded-full bg-white px-5 py-3 text-sm font-semibold text-slate-700 ring-1 ring-slate-200 transition hover:bg-blue-600 hover:text-white hover:ring-blue-600" />

                <asp:HyperLink
                    ID="lnkAiCategory"
                    runat="server"
                    Text="AI / ML"
                    NavigateUrl="~/Pages/public/Projects.aspx?category=ai"
                    CssClass="rounded-full bg-white px-5 py-3 text-sm font-semibold text-slate-700 ring-1 ring-slate-200 transition hover:bg-blue-600 hover:text-white hover:ring-blue-600" />

                <asp:HyperLink
                    ID="lnkJavaCategory"
                    runat="server"
                    Text="Java"
                    NavigateUrl="~/Pages/public/Projects.aspx?q=java"
                    CssClass="rounded-full bg-white px-5 py-3 text-sm font-semibold text-slate-700 ring-1 ring-slate-200 transition hover:bg-blue-600 hover:text-white hover:ring-blue-600" />

            </asp:Panel>

        </asp:Panel>


        <!-- ============================================ -->
        <!-- FEATURED PROJECTS -->
        <!-- ============================================ -->

        <asp:Panel
            ID="pnlFeaturedProjects"
            runat="server"
            ClientIDMode="Static"
            CssClass="py-20">

            <asp:Panel
                ID="pnlFeaturedHeader"
                runat="server"
                CssClass="flex items-end justify-between gap-6">

                <asp:Panel ID="pnlFeaturedTitle" runat="server">

                    <asp:Label
                        ID="lblFeaturedSubtitle"
                        runat="server"
                        Text="HAND-PICKED FOR YOU"
                        CssClass="text-sm font-semibold text-blue-600" />

                    <asp:Label
                        ID="lblFeaturedTitle"
                        runat="server"
                        Text="Featured projects"
                        CssClass="mt-2 block text-3xl font-bold tracking-tight text-slate-950" />

                </asp:Panel>

                <asp:HyperLink
                    ID="lnkViewAllProjects"
                    runat="server"
                    Text="View all projects →"
                    NavigateUrl="~/Pages/public/Projects.aspx"
                    CssClass="text-sm font-semibold text-blue-600 hover:text-blue-800" />

            </asp:Panel>


            <!-- Project Cards -->

            <asp:Panel
                ID="pnlProjectCards"
                runat="server"
                CssClass="mt-8 grid grid-cols-3 gap-6">


                <!-- Projects -->

                <asp:Repeater ID="rptProjectCard" runat="server">
                    <ItemTemplate>

                        <asp:Panel
                            ID="pnlProject1"
                            runat="server"
                            CssClass="overflow-hidden rounded-2xl bg-white shadow-sm ring-1 ring-slate-200 transition hover:-translate-y-1 hover:shadow-lg">

                            <asp:Panel
                                ID="pnlProject1Image"
                                runat="server"
                                CssClass="relative flex aspect-[16/9] items-end bg-gradient-to-br from-violet-500 via-blue-500 to-cyan-400 p-5 overflow-hidden">

                                <asp:Image
                                    ID="imgProject"
                                    runat="server"
                                    ImageUrl='<%# Eval("firstImageUrl") %>'
                                    Visible='<%# Eval("hasImage") %>'
                                    AlternateText='<%# Eval("title") %>'
                                    CssClass="absolute inset-0 h-full w-full object-cover" />

                                <asp:Label
                                    ID="lblProject1Badge"
                                    runat="server"
                                    Text='<%# Eval("category") %>'
                                    CssClass="relative z-10 rounded-lg bg-white/20 px-3 py-1.5 text-xs font-semibold text-white backdrop-blur" />

                            </asp:Panel>

                            <asp:Panel
                                ID="pnlProject1Details"
                                runat="server"
                                CssClass="p-6">

                                <asp:Panel
                                    ID="pnlProject1Heading"
                                    runat="server"
                                    CssClass="flex items-start justify-between gap-3">

                                    <asp:Label
                                        ID="lblProjectName"
                                        runat="server"
                                        Text='<%# Eval("title") %>'
                                        CssClass="font-bold text-slate-950" />

                                    <asp:Panel
                                        ID="Panel1"
                                        runat="server">
                                        
                                    <asp:Label
                                        ID="lblProjectPrice"
                                        runat="server"
                                        Text="₹"
                                        CssClass="whitespace-nowrap text-sm font-bold text-slate-950" />
                                    <asp:Label
                                        ID="lblProject1Price"
                                        runat="server"
                                        Text='<%# Eval("price") %>'
                                        CssClass="whitespace-nowrap text-sm font-bold text-slate-950" />
                                    </asp:Panel>

                                </asp:Panel>

                                <asp:Label
                                    ID="lblProject1Description"
                                    runat="server"
                                    Text='<%# Eval("description") %>'
                                    CssClass="mt-3 block text-sm leading-6 text-slate-600" />

                                <asp:Panel
                                    ID="pnlProject1Meta"
                                    runat="server"
                                    CssClass="mt-5 flex items-center justify-between">

                                    <asp:Label
                                        ID="lblProject1Rating"
                                        runat="server"
                                        Text='<%# Eval("rating") %>'
                                        CssClass="text-sm font-medium text-amber-500" />

                                    <asp:Label
                                        ID="lblProject1Tech"
                                        runat="server"
                                        Text='<%# Eval("technologyList") %>'
                                        CssClass="text-xs font-medium text-slate-500" />

                                </asp:Panel>

                            </asp:Panel>

                        </asp:Panel>
                    </ItemTemplate>
                </asp:Repeater>


                <!-- Project 2 -->

<!-- 
                    <asp:Panel
                    ID="pnlProject2"
                    runat="server"
                    CssClass="overflow-hidden rounded-2xl bg-white shadow-sm ring-1 ring-slate-200 transition hover:-translate-y-1 hover:shadow-lg">

                    <asp:Panel
                        ID="pnlProject2Image"
                        runat="server"
                        CssClass="flex aspect-[16/9] items-end bg-gradient-to-br from-emerald-500 via-teal-500 to-cyan-500 p-5">

                        <asp:Label
                            ID="lblProject2Badge"
                            runat="server"
                            Text="Open source"
                            CssClass="rounded-lg bg-white/20 px-3 py-1.5 text-xs font-semibold text-white backdrop-blur" />

                    </asp:Panel>

                    <asp:Panel
                        ID="pnlProject2Details"
                        runat="server"
                        CssClass="p-6">

                        <asp:Panel
                            ID="pnlProject2Heading"
                            runat="server"
                            CssClass="flex items-start justify-between gap-3">

                            <asp:Label
                                ID="lblProject2Name"
                                runat="server"
                                Text="Creator portfolio kit"
                                CssClass="font-bold text-slate-950" />

                            <asp:Label
                                ID="lblProject2Price"
                                runat="server"
                                Text="₹399"
                                CssClass="whitespace-nowrap text-sm font-bold text-slate-950" />

                        </asp:Panel>

                        <asp:Label
                            ID="lblProject2Description"
                            runat="server"
                            Text="A polished portfolio template to help creators showcase their best work."
                            CssClass="mt-3 block text-sm leading-6 text-slate-600" />

                        <asp:Panel
                            ID="pnlProject2Meta"
                            runat="server"
                            CssClass="mt-5 flex items-center justify-between">

                            <asp:Label
                                ID="lblProject2Rating"
                                runat="server"
                                Text="★ 4.2"
                                CssClass="text-sm font-medium text-amber-500" />

                            <asp:Label
                                ID="lblProject2Tech"
                                runat="server"
                                Text="Web · JavaScript"
                                CssClass="text-xs font-medium text-slate-500" />

                        </asp:Panel>

                    </asp:Panel>

                </asp:Panel>

    -->
                <!-- Project 3 -->
<!--
                <asp:Panel
                    ID="pnlProject3"
                    runat="server"
                    CssClass="overflow-hidden rounded-2xl bg-white shadow-sm ring-1 ring-slate-200 transition hover:-translate-y-1 hover:shadow-lg">

                    <asp:Panel
                        ID="pnlProject3Image"
                        runat="server"
                        CssClass="flex aspect-[16/9] items-end bg-gradient-to-br from-orange-400 via-rose-500 to-fuchsia-600 p-5">

                        <asp:Label
                            ID="lblProject3Badge"
                            runat="server"
                            Text="New release"
                            CssClass="rounded-lg bg-white/20 px-3 py-1.5 text-xs font-semibold text-white backdrop-blur" />

                    </asp:Panel>

                    <asp:Panel
                        ID="pnlProject3Details"
                        runat="server"
                        CssClass="p-6">

                        <asp:Panel
                            ID="pnlProject3Heading"
                            runat="server"
                            CssClass="flex items-start justify-between gap-3">

                            <asp:Label
                                ID="lblProject3Name"
                                runat="server"
                                Text="Expense tracker"
                                CssClass="font-bold text-slate-950" />

                            <asp:Label
                                ID="lblProject3Price"
                                runat="server"
                                Text="₹299"
                                CssClass="whitespace-nowrap text-sm font-bold text-slate-950" />

                        </asp:Panel>

                        <asp:Label
                            ID="lblProject3Description"
                            runat="server"
                            Text="Keep personal finances simple with thoughtful charts and useful insights."
                            CssClass="mt-3 block text-sm leading-6 text-slate-600" />

                        <asp:Panel
                            ID="pnlProject3Meta"
                            runat="server"
                            CssClass="mt-5 flex items-center justify-between">

                            <asp:Label
                                ID="lblProject3Rating"
                                runat="server"
                                Text="★ 4.5"
                                CssClass="text-sm font-medium text-amber-500" />

                            <asp:Label
                                ID="lblProject3Tech"
                                runat="server"
                                Text="App · Python"
                                CssClass="text-xs font-medium text-slate-500" />

                        </asp:Panel>

                    </asp:Panel>

                </asp:Panel>
    -->

            </asp:Panel>

        </asp:Panel>


        <!-- ============================================ -->
        <!-- PROJECT REQUEST CTA -->
        <!-- ============================================ -->

        <asp:Panel
            ID="pnlProjectRequests"
            runat="server"
            CssClass="mb-4 rounded-3xl bg-slate-950 px-12 py-16 text-center text-white">

            <asp:Label
                ID="lblRequestSubtitle"
                runat="server"
                Text="CAN'T FIND THE RIGHT FIT?"
                CssClass="text-sm font-semibold text-blue-300" />

            <asp:Label
                ID="lblRequestTitle"
                runat="server"
                Text="Still didn’t find what you are looking for?"
                CssClass="mx-auto mt-3 block max-w-2xl text-4xl font-bold tracking-tight" />

            <asp:Label
                ID="lblRequestDescription"
                runat="server"
                Text="Post a request with your requirements and let the community build it for you."
                CssClass="mx-auto mt-5 block max-w-2xl leading-7 text-slate-300" />

            <asp:HyperLink
                ID="lnkRequest"
                runat="server"
                Text="Post a request"
                NavigateUrl="~/Pages/public/Login.aspx?returnUrl=/Pages/client/PostRequest.aspx"
                CssClass="mt-8 inline-flex rounded-xl bg-white px-6 py-3 text-sm font-semibold text-slate-950 transition hover:bg-blue-50" />

        </asp:Panel>

    </main>

</asp:Content>