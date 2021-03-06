{include file="{$PastaTema}/includes/header.tpl"}
<style type="text/css">
    .FullWidth {
        width: calc(100% - 12px); /* IE 9,10 , Chrome, Firefox */
        width: -webkit-calc(100% - 12px); /*For safari 6.0*/
    }
    #Ip {
        width: calc(60% - 15px); /* IE 9,10 , Chrome, Firefox */
        width: -webkit-calc(60% - 15px); /*For safari 6.0*/
    }
    #Porta {
        width: calc(19% - 15px); /* IE 9,10 , Chrome, Firefox */
        width: -webkit-calc(19% - 15px); /*For safari 6.0*/
    }

    #PortaQuery {
        width: calc(19% - 15px); /* IE 9,10 , Chrome, Firefox */
        width: -webkit-calc(19% - 15px); /*For safari 6.0*/
    }
    .Erro
    {
        background-color: red;
    }

    .Sucesso
    {
        background-color: green;
    }
</style>
        <!-- BACKGROUND -->
        <img src="templates/{$PastaTema}/img/background-2.jpg" class="background" alt="" style="width: 100%; height: 100%"/>
        <!-- /BACKGROUND -->

        <!-- MAIN CONTENT SECTION -->
        <section id="content">

            <!-- SECTION -->
            <section class="clearfix section" id="start">
			
                <!-- SECTION TITLE -->
                <h3 class="block-title">{$Lang['ola']}, {$Utilizador['Nome']} {$Utilizador['Apelido']}</h3>
                <!-- /SECTION TITLE -->
                
                <!-- SECTION TILES -->

                <div class="tile white icon-featureccw w2 h1 title-fadeout">
                    <a href="index.php">
                        <i class="icon-windows icon-4x"></i>
                        <p class="title">{$Lang['titulo_painelPrincipal']}</p>
                    </a>
                </div>

                <div class="tile orange icon-featureccw w2 h1 title-fadeout">
                    <a href="definicoes.php">
                        <i class="icon-gear icon-4x"></i>
                        <p class="title">{$Lang['menu_definicoes']}</p>
                    </a>
                </div>

                <div class="tile blue title-verticalcenter icon-flip w2 h1">
                    <a href="profile.php">
                        <i class="icon-user icon-4x"></i>
                        <p class="title">{$Lang['menu_perfil']}</p>
                    </a>
                </div>
                {if $Utilizador['IsAdmin']}
                <div class="tile purple title-scaleup icon-scaledownrotate360cw w1 h1">
                    <a href="admin.php">
                        <i class="icon-envelope icon-4x"></i>
                        <p class="title">{$Lang['zona_administracao']}</p>
                    </a>
                </div>
                {/if}
                <div class="tile yellow icon-flip title-fadeout w1 h1">
                    <a href="ajuda.php">
                        <i class="icon-question-sign icon-4x"></i>
                        <p class="title">{$Lang['zona_ajuda']}</p>
                    </a>
                </div>
				
				<div class="tile red icon-featureccw w1 h1 title-fadeout">
                    <a href="criarServidor.php">
                        <i class="icon-plus-sign icon-4x"></i>
                        <p class="title">{$Lang['zona_criarServidor']}</p>
                    </a>
                </div>
				
				<div class="tile black icon-featureccw w1 h1 title-fadeout">
                    <a href="logout.php">
                        <i class="icon-off icon-4x"></i>
                        <p class="title">{$Lang['menu_terminarSessao']}</p>
                    </a>
                </div>
				
				{if $Utilizador['OldUser'] == true}
				<div class="tile black w1 h1 title-horizontalcenter icon-scaleuprotate360cw">
                    <a href="index.php?Option=Login">
                        <i class="icon-user icon-4x"></i>
                        <p class="title">{$Lang['botao_voltarContaAnterior']}</p>
                    </a>
                </div>
				{/if}

            </section>

			
			
			
			
			
			<section class="clearfix section isotope" id="criarServidor">
                <div class="tile black htmltile w4 h3 isotope-item mCustomScrollbar _mCS_2">
                    {if $Utilizador['MaxServidores'] <= $Utilizador['NumServidores']}
                        <h3><font color="red">{$Lang['alerta_esgotasteServidores']}</font>
                    {else}
                        {if $NumTiposServidores > 0}
                            <form action="includes/api.php" method="GET">

                                <input type="hidden" name="Action" value="CriarServidor">
                                <input type="text" class="FullWidth" name="NomeServidor" placeholder="{$Lang['input_nomeDoServidor']}" required/><br />
                                <input type="text" id="Ip" name="Ip" value="{$IpServidor}" placeholder="{$Lang['input_ipDoServidor']}" required />
                                <input type="text" id="Porta" name="Porta" onchange="verificaPorta(this, 1);" placeholder="{$Lang['input_portaDoServidor']}" required/>
                                <input type="text" id="PortaQuery" name="PortaQuery" onchange="verificaPorta(this, 2);" placeholder="{$Lang['input_portaQueryDoServidor']}" required/><br />
                                
                                <input type="text" class="FullWidth" name="Motd" placeholder="{$Lang['input_motd']}" required/><br /><br />
                                <input type="text" class="FullWidth" name="Mapa" placeholder="{$Lang['input_mapa']}" required/><br /><br />
                                
                                <label>{$Lang['label_modoLan']}</label><br />
                                <select name="OnlineMode" required>
                                    <option value="0">{$Lang['nao']}</option>
                                    <option value="1">{$Lang['sim']}</option>
                                </select>
                                <input type="number" name="MaxSlots" class="pull-right" value="1" min="1" max="32" required>
                                <label class="pull-right">{$Lang['label_slots_1']} 1{$Lang['label_slots_2']} 32{$Lang['label_slots_3']}&nbsp;&nbsp;&nbsp;</label>
                                <br /><br />

                                <label>{$Lang['label_tipoServidor']}</label><br />
                                <select name="TipoServidor" required>
                                <option value="">{$Lang['select_default']}</option>
                                {foreach $TiposServidores as $TipoServidor}
                                        <option value="{$TipoServidor['Id']}">{$TipoServidor['Nome']}</option>
                                {/foreach}
                                </select>
                                <br />
                                <br />
                                <input type="submit" class="btn btn-success" value="{$Lang['botao_criarServidor']}">
                            </form>
                        {else}
                            <h2>N&atilde;o existem servidores pre-configurados!</h2>
                        {/if}
                    {/if}
                </div>
            </section>
        </section>
        <!-- /MAIN CONTENT SECTION -->

        <!-- LOCKSCREEN -->
        <section class="mlightbox" id="lockscreen">
            <div id="lockscreen-content">
                <img src="templates/{$PastaTema}/img/logo.png" height="109" width="140" id="locklogo"  alt="Metromega"/>
                <br/><br/>
                <img src="templates/{$PastaTema}/img/preloader.gif" id="lockloader" alt="{$Lang['a_carregar']}"/>
            </div>
        </section>
        <!-- /LOCKSCREEN -->

        {include file="{$PastaTema}/includes/sideMenu.tpl"}

        <!-- PRELOADER -->
        <section class="mlightbox" id="loader">
            <a href="#">
                <img src="templates/{$PastaTema}/img/preloader.gif" alt="{$Lang['a_carregar']}"/>
            </a>
        </section>

        <!-- /PRELOADER -->
<script type="text/javascript">
    var pw;
    var repPw;
    $("#AlterarPassword").addClass("disabled");
    function setRepPw(a)
    {
        console.log("RepPw = "+a.value);
        repPw = a.value;
    }

    function setPw(a)
    {
        pw = a.value;
    }

    function verificaPasswords()
    {
        if(pw == repPw)
        {
            console.log("Okay");
            $("#RepNovaPassword").removeClass('Erro').addClass('Sucesso');
            $("#NovaPassword").removeClass('Erro').addClass('Sucesso');
            $("#AlterarPassword").removeClass("disabled");
        }
        else
        {
            console.log("erro");
            $("#RepNovaPassword").removeClass('Sucesso').addClass('Erro');
            $("#NovaPassword").removeClass('Sucesso').addClass('Erro');
            $("#AlterarPassword").removeClass("disabled").addClass("disabled");
        }
    } -->
</script> 
{include file="{$PastaTema}/includes/footer.tpl"}