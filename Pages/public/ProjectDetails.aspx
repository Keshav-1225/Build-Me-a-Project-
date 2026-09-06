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
            Text=" ← Back to projects"
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
                    CssClass="relative overflow-hidden aspect-[16/9] rounded-3xl bg-gradient-to-br from-violet-500 via-blue-500 to-cyan-400 p-8 group cursor-pointer">

                    <asp:Repeater ID="rptImages" runat="server">
                        <ItemTemplate>

                            <asp:Image ID="projectImage"
                                runat="server"
                                ImageUrl='<%# ResolveUrl(Container.DataItem) %>'
                                AlternateText='<%# lblProjectName.Text %>'
                                CssClass="project-slide absolute inset-0 h-full w-full object-cover transition-opacity duration-500 opacity-0 pointer-events-none"/>
                        </ItemTemplate>
                    </asp:Repeater>

                    <!-- Slider Navigation Buttons -->
                    <asp:Button ID="btnPrev"
                        runat="server"
                        Text="&#10094;"
                        ToolTip="Previous image"
                        CausesValidation="false"
                        UseSubmitBehavior="false"
                        OnClientClick="return false;"
                        CssClass="absolute left-4 top-1/2 z-20 h-10 w-10 -translate-y-1/2 cursor-pointer rounded-full bg-black/40 text-white backdrop-blur transition hover:bg-black/70 focus:outline-none select-none" />
                    <asp:Button ID="btnNext"
                        runat="server"
                        Text="&#10095;"
                        ToolTip="Next image"
                        CausesValidation="false"
                        UseSubmitBehavior="false"
                        OnClientClick="return false;"
                        CssClass="absolute right-4 top-1/2 z-20 h-10 w-10 -translate-y-1/2 cursor-pointer rounded-full bg-black/40 text-white backdrop-blur transition hover:bg-black/70 focus:outline-none select-none" />

                    <!-- Slider Indicators -->
                    <div id="sliderIndicators" class="absolute bottom-4 left-1/2 -translate-x-1/2 z-20 flex gap-2"></div>

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
                        </asp:HyperLink></asp:Panel><!-- Description --><asp:Label
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
                    OnClientClick="return confirm('project added to the cart')"
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

    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {
            var container = document.getElementById('<%= pnlProjectPreview.ClientID %>');
            if (!container) return;

            var slides = container.querySelectorAll('.project-slide');
            var btnPrev = document.getElementById('<%= btnPrev.ClientID %>');
            var btnNext = document.getElementById('<%= btnNext.ClientID %>');
            var indicatorsContainer = document.getElementById('sliderIndicators');

            if (!slides || slides.length === 0) {
                if (btnPrev) btnPrev.style.display = 'none';
                if (btnNext) btnNext.style.display = 'none';
                return;
            }

            var currentIndex = 0;
            var autoPlayInterval = null;
            var isPaused = false;

            function initSlider() {
                slides.forEach(function (slide, idx) {
                    if (idx === 0) {
                        slide.classList.remove('opacity-0', 'pointer-events-none');
                        slide.classList.add('opacity-100', 'z-10');
                    } else {
                        slide.classList.remove('opacity-100', 'z-10');
                        slide.classList.add('opacity-0', 'pointer-events-none');
                    }

                    if (indicatorsContainer) {
                        var dot = document.createElement('button');
                        dot.type = 'button';
                        dot.setAttribute('aria-label', 'Go to slide ' + (idx + 1));
                        dot.className = 'h-2.5 transition-all rounded-full ' + (idx === 0 ? 'bg-white w-6' : 'bg-white/50 hover:bg-white/80 w-2.5');
                        dot.addEventListener('click', function (e) {
                            e.stopPropagation();
                            goToSlide(idx);
                            pauseAutoPlay();
                        });
                        indicatorsContainer.appendChild(dot);
                    }
                });

                if (slides.length > 1) {
                    startAutoPlay();
                }
            }

            function goToSlide(index) {
                slides[currentIndex].classList.remove('opacity-100', 'z-10');
                slides[currentIndex].classList.add('opacity-0', 'pointer-events-none', 'z-0');

                if (indicatorsContainer && indicatorsContainer.children[currentIndex]) {
                    indicatorsContainer.children[currentIndex].className = 'h-2.5 w-2.5 rounded-full bg-white/50 hover:bg-white/80 transition-all';
                }

                currentIndex = (index + slides.length) % slides.length;

                slides[currentIndex].classList.remove('opacity-0', 'pointer-events-none', 'z-0');
                slides[currentIndex].classList.add('opacity-100', 'z-10');

                if (indicatorsContainer && indicatorsContainer.children[currentIndex]) {
                    indicatorsContainer.children[currentIndex].className = 'h-2.5 w-6 rounded-full bg-white transition-all';
                }
            }

            function nextSlide() {
                goToSlide(currentIndex + 1);
            }

            function prevSlide() {
                goToSlide(currentIndex - 1);
            }

            function startAutoPlay() {
                if (autoPlayInterval) clearInterval(autoPlayInterval);
                autoPlayInterval = setInterval(function () {
                    if (!isPaused) {
                        nextSlide();
                    }
                }, 3000);
            }

            function pauseAutoPlay() {
                isPaused = true;
                if (autoPlayInterval) {
                    clearInterval(autoPlayInterval);
                    autoPlayInterval = null;
                }
            }

            if (btnPrev) {
                btnPrev.addEventListener('click', function (e) {
                    e.stopPropagation();
                    e.preventDefault();
                    prevSlide();
                    pauseAutoPlay();
                });
            }

            if (btnNext) {
                btnNext.addEventListener('click', function (e) {
                    e.stopPropagation();
                    e.preventDefault();
                    nextSlide();
                    pauseAutoPlay();
                });
            }

            container.addEventListener('click', function () {
                pauseAutoPlay();
            });

            initSlider();
        });
    </script>

</asp:Content>
