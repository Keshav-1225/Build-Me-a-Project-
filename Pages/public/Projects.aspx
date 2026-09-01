<%@ Page Title="Explore Projects" Language="VB" MasterPageFile="~/Masters/Site.Master" AutoEventWireup="true" CodeBehind="Projects.aspx.vb" Inherits="BuildMeAProject.Projects1" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="pnlMain" runat="server" CssClass="py-14">

        <!-- Header & Search -->
        <asp:Panel
            ID="pnlHeader" 
            runat="server" 
            CssClass="flex items-end justify-between border-b border-slate-200 pb-9">
            
            <asp:Panel 
                ID="pnlHeaderText" 
                runat="server">
                <!-- ===== HEADER ===== -->
                <asp:Label 
                    ID="lblPageType" 
                    runat="server" 
                    Text="MARKETPLACE" 
                    CssClass="text-sm font-semibold text-blue-600" />
                
                <asp:Label 
                    ID="lblPageTitle" 
                    runat="server" 
                    Text="Explore projects" 
                    CssClass="mt-2 block text-4xl font-bold tracking-tight text-slate-950" />
                
                <asp:Label
                    ID="lblPageDescription" 
                    runat="server" 
                    Text="Ready-to-use projects created by the community." 
                    CssClass="mt-3 block text-slate-600" />
            </asp:Panel>

            <!-- ===== SEARCH ===== -->
            <asp:Panel 
                ID="pnlSearch"
                runat="server" 
                CssClass="flex w-[390px] items-center rounded-xl border border-slate-300 bg-white px-3 shadow-sm">
                
                <asp:TextBox 
                    ID="txtSearch" 
                    runat="server" 
                    CssClass="w-full border-0 px-2 py-3 text-sm outline-none" 
                    Placeholder="Search projects" />
                
                <asp:Button 
                    ID="btnSearch" 
                    runat="server" 
                    Text="Search" 
                    OnClick="btnSearch_Click"
                    CssClass="text-sm font-semibold text-blue-600 bg-transparent cursor-pointer" />
            </asp:Panel>
        </asp:Panel>

        <!-- Main Content (Filters + Results Grid) -->
        <asp:Panel ID="pnlContent" runat="server" CssClass="mt-8 grid grid-cols-[240px_1fr] gap-10">

            <!-- Sidebar Filters -->
            <asp:Panel 
                ID="pnlFilters" 
                runat="server" 
                CssClass="h-fit rounded-2xl bg-white p-6 shadow-sm ring-1 ring-slate-200">
                
                <asp:Label 
                    ID="lblFilters" 
                    runat="server" 
                    Text="Filters" 
                    CssClass="block font-bold text-slate-950" />

                <!-- =====Category Filter===== -->
                <asp:Panel 
                    ID="pnlCategoryFilter" 
                    runat="server" 
                    CssClass="mt-6 border-t border-slate-100 pt-5">
                    
                    <asp:Label 
                        ID="lblCategory" 
                        runat="server" 
                        Text="Category" 
                        CssClass="block text-sm font-semibold" />
                    
                    <asp:Panel 
                        ID="pnlCategoryOptions" 
                        runat="server" 
                        CssClass="mt-3 space-y-3 text-sm text-slate-600">
                        
                        <asp:CheckBox
                            Text=" Web" 
                            ID="chkWeb" runat="server" 
                            AutoPostBack="true"
                            OnCheckedChanged="Filter_Changed"
                            CssClass="flex gap-2 items-center cursor-pointer" />
                        
                        <asp:CheckBox
                            Text=" App" 
                            ID="chkApp" runat="server" 
                            AutoPostBack="true"
                            OnCheckedChanged="Filter_Changed"
                            CssClass="flex gap-2 items-center cursor-pointer" />
                        
                        <asp:CheckBox 
                            Text=" Python" 
                            ID="chkPython" runat="server" 
                            AutoPostBack="true"
                            OnCheckedChanged="Filter_Changed"
                            CssClass="flex gap-2 items-center cursor-pointer" />
                        
                        <asp:CheckBox 
                            Text=" AI / ML" 
                            ID="chkAI" runat="server" 
                            AutoPostBack="true"
                            OnCheckedChanged="Filter_Changed"
                            CssClass="flex gap-2 items-center cursor-pointer" />
                    </asp:Panel>
                </asp:Panel>

                <!-- Price Filter -->
                <asp:Panel ID="pnlPriceFilter" runat="server" CssClass="mt-6 border-t border-slate-100 pt-5">
                    <asp:Label ID="lblPriceRange" runat="server" Text="Price range" CssClass="block text-sm font-semibold" />
                    <asp:Panel ID="pnlPriceOptions" runat="server" CssClass="mt-3 space-y-3 text-sm text-slate-600">
                        <asp:CheckBox ID="chkFree" runat="server" Text=" Free" AutoPostBack="true" OnCheckedChanged="Filter_Changed" CssClass="flex gap-2 items-center cursor-pointer" />
                        <asp:CheckBox ID="chkPaid" runat="server" Text=" Paid" AutoPostBack="true" OnCheckedChanged="Filter_Changed" CssClass="flex gap-2 items-center cursor-pointer" />
                        <asp:CheckBox ID="chkUnder500" runat="server" Text=" Under ₹500" AutoPostBack="true" OnCheckedChanged="Filter_Changed" CssClass="flex gap-2 items-center cursor-pointer" />
                    </asp:Panel>
                </asp:Panel>

                <asp:Button ID="btnClearFilters" runat="server" Text="Clear filters" OnClick="btnClearFilters_Click" CssClass="mt-7 w-full rounded-lg border border-slate-300 py-2.5 text-sm font-semibold text-slate-700 hover:bg-slate-50 transition cursor-pointer" />
            </asp:Panel>

            <!-- Results Section -->
            <asp:Panel ID="pnlResults" runat="server">
                <asp:Panel ID="pnlResultHeader" runat="server" CssClass="flex items-center justify-between">
                    <asp:Label ID="lblProjectCount" runat="server" Text="Showing 0 projects" CssClass="text-sm text-slate-500" />
                    <asp:DropDownList ID="ddlSort" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Filter_Changed" CssClass="rounded-lg border border-slate-300 bg-white px-3 py-2 text-sm text-slate-700 cursor-pointer">
                        <asp:ListItem Text="Sort by: Popular" Value="Popular" />
                        <asp:ListItem Text="Newest" Value="Newest" />
                        <asp:ListItem Text="Price: Low to high" Value="PriceLowHigh" />
                    </asp:DropDownList>
                </asp:Panel>

                <!-- Project Cards Grid -->
                <asp:Panel
                    ID="pnlProjectCards" 
                    runat="server" 
                    CssClass="mt-5 grid grid-cols-3 gap-5">
                    
                    <asp:Repeater ID="rptProjects" runat="server">
                        <ItemTemplate>
                            <!--PROJECT CARD-->
                            <asp:HyperLink ID="lnkProjectDetails"
                                runat="server"
                                NavigateUrl='<%# "~/Pages/public/ProjectDetails.aspx?id=" & Eval("ID") %>'>
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
                                                runat="server" Text="INR."
                                                CssClass="whitespace-nowrap
                                                text-sm font-bold text-slate-950" />
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
                            </asp:HyperLink>
                        </ItemTemplate>
                    </asp:Repeater>
                </asp:Panel>
            </asp:Panel>

        </asp:Panel>

    </asp:Panel>
</asp:Content>
