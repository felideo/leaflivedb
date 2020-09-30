    <!-- ******PROMO****** -->
    <!-- <section id="promo" class="promo leaf section offset-header has-pattern"> -->
    <section id="promo" class="promo leaf section offset-header has-pattern">
        <div class="container">
            <div class="row">
                <div class="overview col-md-8 col-sm-12 col-xs-12" style="background-color: rgba(0, 0, 0, 0.5); border-radius: 15px;">
                    <h2 class="title">Banco de Dados Taxonômicos</h2>
                    <p class="title" style="font-size: 20px;">O LeafLive-DB é um ambiente colaborativo que permite o compartilhamento de informações sobre espécies vegetais , características e taxonomias.</p>
                    <ul class="summary">
                        <li>Compartilhe suas pesquisas</li>
                        <li>Cadastro de Plantas</li>
                        <li>Busca de artigos científicos</li>
                        <li>Envio de artigos publicados</li>
                    </ul>
                    <!-- <div class="download-area"> -->
                        <!-- <ul class="btn-group list-inline">
                            <li class="ios-btn"><a href="#">Download from the App Store</a></li>
                            <li class="android-btn"><a href="#">Get it from Google Play</a></li>
                        </ul>
                        <div class="note text-center">
                            <p>30% OFF - Now only $0.99<br />Offer ends 31st March</p>
                            <span class="left-arrow"></span>
                            <span class="right-arrow"></span>
                        </div><!--//note-->
                    <!-- </div> -->
                </div><!--//overview-->

                <!--// iPhone starts -->
                <div class="phone iphone iphone-black col-md-4 col-sm-12 col-xs-12 " style="height: 305px;">
                    <div class="iphone-holder phone-holder">
                        <div class="iphone-holder-inner">
                            <div class="slider flexslider" style="background: transparent; overflow: hidden; max-height: 205px;">
                                <ul class="slides">
                                    <?php
                                        if(isset($this->imagens[0]) && !empty($this->imagens[0])){
                                            foreach ($this->imagens as $indice => $imagem){
                                                echo "<li style='overflow: hidden; background: none;'><img src='/{$imagem['arquivo'][0]['endereco']}'  alt='' /></li>";
                                            }
                                        }
                                    ?>
                                </ul><!--//slides-->
                            </div><!--//flexslider-->
                        </div><!--//iphone-holder-inner-->
                    </div><!--//iphone-holder-->
                </div><!--//iphone-->
                <!--// iPhone ends -->
            </div><!--//row-->
        </div><!--//container-->
    </section><!--//promo-->




    <!-- ******FEATURES****** -->
    <section id="features" class="features section">
        <div class="container">
            <div class="row">
            	<div class="col-md-12 col-sm-12 col-xs-12 text-left" style="margin-bottom: 30px;">
            		<h4><strong>Buscar</strong></h4>
					<p>“Acesse as opções de acesso rápido para busca de espécies taxonomias”.</p>
					<h4><strong>Colabore - Compartilhe</strong></h4>
					<p>“Você deve realizar o seu cadastro no LeafLive-DB  para poder contribuir e compartilhar novas taxonomias, artigos, fotos e outras informações”.</p>
            	</div>
            </div>
            <div class="row">
                <!-- <h2 class="title text-center sr-only">Features</h2> -->
                <div class="item col-md-3 col-sm-6 col-xs-12 text-center">
            	    <?php if(!empty($_SESSION['logado'])) : ?>
				    	<a href="/organismo/cadastro">
				    <?php else : ?>
				    	<a href="/acesso/login">
				    <?php endif ?>
	                    <div class="icon">
	                        <i class="fa fa-users"></i>
	                    </div><!--//icon-->
	                    <div class="content">
	                        <h3 class="title">Colabore</h3>
	                        <p>Ambiente colaborativo para biologos, taxonomistas, estudantes</p>
	                    </div><!--//content-->
	                </a>
                </div><!--//item-->
                <div class="item col-md-3 col-sm-6 col-xs-12 text-center">
            	    <?php if(!empty($_SESSION['logado'])) : ?>
				    	<a href="/organismo/cadastro">
				    <?php else : ?>
				    	<a href="/acesso/login">
				    <?php endif ?>
	                    <div class="icon">
	                        <i class="fa fa-plus-circle"></i>
	                    </div><!--//icon-->
	                    <div class="content">
	                        <h3 class="title">Cadastre</h3>
	                        <p>Insira novas especies no banco de dados, sua taxonomia, locais de ocorrencia e muito mais</p>
	                    </div><!--//content-->
	                </a>
                </div><!--//item-->
                <div class="item col-md-3 col-sm-6 col-xs-12 text-center">
                	<a href="/busca/buscar">
	                    <div class="icon">
	                        <i class="fa fa-share-alt"></i>
	                    </div><!--//icon-->
	                    <div class="content">
	                        <h3 class="title">Compartilhe</h3>
	                        <p>Relacione trabalhos cientificos, artigos e links a planta e dissemine o conhecimento</p>
	                    </div><!--//content-->
                	</a>
                </div><!--//item-->
                <div class="item col-md-3 col-sm-6 col-xs-12 text-center">
                	<a href="/busca/buscar">
	                    <div class="icon">
	                        <i class="fa fa-search"></i>
	                    </div><!--//icon-->
	                    <div class="content">
	                        <h3 class="title">Busque</h3>
	                        <p>Consulte taxonomias, busque por especies, localize trabalhos relacionados</p>
	                    </div><!--//content-->
                	</a>
                </div><!--//item-->
            </div><!--//row-->


        </div><!--//container-->
    </section><!--//features-->

    <!-- ******APOIO****** -->
    <!-- <section id="pricing" class="pricing section has-pattern">
        <div class="container">
             <div class="price-cols row">
                <h2 class="title text-center">Apoio</h2>
                <div class="items-wrapper col-md-10 col-sm-12 col-xs-12 col-md-offset-1 col-sm-offset-0 col-xs-offset-0">
                    <div class="item price-1 col-md-4 col-sm-4 col-xs-12 text-center">
                        <div class="item-inner">
                            <img src="../../../public/images/umc.jpg">
                        </div>
                    </div>

                    <div class="item price-2 col-md-4 col-sm-4 col-xs-12 text-center best-buy">
                        <div class="item-inner">
                            <img src="../../../public/images/biosenselab.png" style="margin-top: 23%;">
                        </div>
                    </div>

                    <div class="item price-3 col-md-4 col-sm-4 col-xs-12 text-center">
                        <div class="item-inner">
                            <img src="../../../public/images/faep.jpg">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> -->
