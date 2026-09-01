<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masters/Site.Master" CodeBehind="ProjectDetails.aspx.vb" Inherits="BuildMeAProject.ProjectDetails1" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Main Container -->

    <asp:Panel
        ID="pnlMain"
        runat="server"
        CssClass="py-12">


        <!-- Back to Projects -->

        <asp:HyperLink
            ID="lnkBackToProjects"
            runat="server"
            Text="← Back to projects"
            NavigateUrl="~/Pages/public/Projects.aspx"
            CssClass="text-sm font-semibold text-blue-600 hover:text-blue-800" />


        <!-- Content Grid -->

        <asp:Panel
            ID="pnlContent"
            runat="server"
            CssClass="mt-6 grid grid-cols-[1fr_350px] gap-10">


            <!-- ============================================ -->
            <!-- LEFT CONTENT -->
            <!-- ============================================ -->

            <asp:Panel
                ID="pnlProjectContent"
                runat="server">


                <!-- Project Preview -->

                <asp:Panel
                    ID="pnlProjectPreview"
                    runat="server"
                    CssClass="aspect-[16/9] rounded-3xl bg-gradient-to-br from-violet-500 via-blue-500 to-cyan-400 p-8">

                    <asp:Repeater ID="rptImages" runat="server">
                        <ItemTemplate>

                            <asp:Image ID="projectImage"
                                runat="server"
                                ImageUrl='<%# ResolveUrl(Container.DataItem) %>'
                                AlternateText='<%# lblProjectName.Text %>'
                                CssClass="project-slide absolute inset-0 h-full w-full object-cover"/>
                        </ItemTemplate>
                    </asp:Repeater>

                </asp:Panel>


                <!-- Project Information -->

                <asp:Panel
                    ID="pnlProjectInfo"
                    runat="server"
                    CssClass="mt-10">


                    <!-- Title + Rating -->

                    <asp:Panel
                        ID="pnlProjectHeader"
                        runat="server"
                        CssClass="flex items-start justify-between">

                        <asp:Panel
                            ID="pnlProjectTitle"
                            runat="server">

                            <asp:Label
                                ID="lblCategory"
                                runat="server"
                                Text="CATEGORY"
                                CssClass="text-sm font-semibold text-blue-600" />

                            <asp:Label
                                ID="lblProjectName"
                                runat="server"
                                Text="Project Title"
                                CssClass="mt-2 block text-4xl font-bold tracking-tight" />

                        </asp:Panel>

                        <asp:HyperLink ID="HyperLink1" runat="server">
                        <asp:Label
                            ID="lblRating"
                            runat="server"
                            Text="★ "
                            CssClass="text-lg font-semibold text-amber-500" />
                        </asp:HyperLink>

                    </asp:Panel>


                    <!-- Description -->

                    <asp:Label
                        ID="lblProjectDescription"
                        runat="server"
                        Text="Description"
                        CssClass="mt-6 block max-w-3xl text-lg leading-8 text-slate-600" />


                    <!-- What's Included -->

                    <asp:Label
                        ID="lblIncludedTitle"
                        runat="server"
                        Text="Setup Instructions"
                        CssClass="mt-10 block text-2xl font-bold" />

                    <asp:Panel
                        ID="pnlIncluded"
                        runat="server"
                        CssClass="mt-4 flex gap-3 text-slate-600">

                        <asp:Label
                            ID="lblSetupInstructions"
                            runat="server"
                            Text="✓ Personal study schedules"
                            CssClass="block" />

                    </asp:Panel>


                    <!-- Tech Stack -->

                    <asp:Label
                        ID="lblTechStackTitle"
                        runat="server"
                        Text="Tech stack"
                        CssClass="mt-10 block text-2xl font-bold" />

                    <asp:Panel
                        ID="pnlTechStack"
                        runat="server"
                        CssClass="mt-4 flex gap-2">

                        <asp:Repeater ID="rptTechnologies" runat="server">
                            <ItemTemplate>

                        <asp:Label
                            ID="lblTech"
                            runat="server"
                            Text='<%# Container.DataItem %>'
                            CssClass="rounded-full bg-blue-50 px-4 py-2 text-sm font-semibold text-blue-700" />
                            </ItemTemplate>
                        </asp:Repeater>

                    </asp:Panel>

                </asp:Panel>

            </asp:Panel>


            <!-- ============================================ -->
            <!-- RIGHT SIDEBAR -->
            <!-- ============================================ -->

            <asp:Panel
                ID="pnlPurchase"
                runat="server"
                CssClass="h-fit rounded-2xl bg-white p-7 shadow-sm ring-1 ring-slate-200">


                <!-- Price -->

                <asp:Label
                    ID="lblPriceTitle"
                    runat="server"
                    Text="Project price"
                    CssClass="text-sm text-slate-500" />

                <asp:Label
                    ID="lblPrice"
                    runat="server"
                    Text="₹499"
                    CssClass="mt-1 block text-4xl font-bold" />


                <!-- Buy -->

                <asp:Button
                    ID="btnBuyNow"
                    runat="server"
                    Text="Buy now"
                    CssClass="mt-6 block w-full rounded-xl bg-blue-600 py-3 text-center text-sm font-semibold text-white hover:bg-blue-700"
                    OnClick="btnBuyNow_Click" />


                <!-- Wishlist -->

                <asp:Button
                    ID="btnWishlist"
                    runat="server"
                    Text="Add to wishlist"
                    CssClass="mt-3 w-full rounded-xl border border-slate-300 py-3 text-sm font-semibold text-slate-700"
                    OnClick="btnWishlist_Click"
                    CausesValidation="false" />


                <!-- Project Metadata -->

                <asp:Panel
                    ID="pnlMetadata"
                    runat="server"
                    CssClass="mt-7 border-t border-slate-100 pt-6 text-sm text-slate-600">


                    <asp:Label
                        ID="lblSeller"
                        runat="server"
                        Text="Seller: Aditi Sharma"
                        CssClass="block" />


                    <asp:Label
                        ID="lblUpdated"
                        runat="server"
                        Text="Updated: 2 days ago"
                        CssClass="mt-3 block" />


                    <asp:Label
                        ID="lblLicense"
                        runat="server"
                        Text="License: Personal use"
                        CssClass="mt-3 block" />

                </asp:Panel>


                <!-- Message -->

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="mt-5 block text-sm font-medium" />

            </asp:Panel>

        </asp:Panel>

    </asp:Panel>

</asp:Content>