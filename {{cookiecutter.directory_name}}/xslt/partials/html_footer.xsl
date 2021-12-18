<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xsl xs"
    version="2.0">
    <xsl:template match="/" name="html_footer">
        
        <div class="wrapper fundament-default-footer" id="wrapper-footer-full" style="margin-top: 4em;">
            <div class="container" id="footer-full-content" tabindex="-1">
                <div class="footer-separator">
                    CONTACT
                </div>
                <div class="row">
                    <div class="footer-widget col-lg-1 col-md-2 col-sm-2 col-xs-6  ml-auto  text-center ">
                        <div class="textwidget custom-html-widget">
                            <a href="/"><img src="https://fundament.acdh.oeaw.ac.at/common-assets/images/acdh_logo.svg" class="image" alt="ACDH Logo" style="max-width: 100%; height: auto;" title="ACDH Logo"/></a>
                        </div>
                    </div>
                    <!-- .footer-widget -->
                    <div class="footer-widget col-lg-4 col-md-3 col-sm-3">
                        <div class="textwidget custom-html-widget">
                            <p>
                                ACDH-CH OEAW
                                <br/>
                                Austrian Centre for Digital Humanities and Cultural Heritage
                                <br/>
                                Austrian Academy of Sciences
                            </p>
                            <p>
                                Sonnenfelsgasse 19
                                <br/>
                                1010 Vienna
                            </p>
                            <p>
                                T: +43 1 51581-2200
                                <br/>
                                E: <a href="mailto:acdh@oeaw.ac.at">acdh@oeaw.ac.at</a>
                            </p>
                        </div>
                    </div>
                    <div class="footer-widget col-lg-4 col-md-3 col-sm-4">
                        <h6 class="font-weight-bold">PROJECT PARTNERS</h6>
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-12">
                                    <div class="flex-md-row mb-4 align-items-center">
                                        <a href="https://acdh.oeaw.ac.at"><img class="card-img-right flex-auto d-md-block" src="https://fundament.acdh.oeaw.ac.at/common-assets/images/acdh_logo.svg" alt="ACDH Logo" style="max-width: 60px; height: auto;" title="ACDH Logo" /></a>
                                        <div class="card-body d-flex flex-column align-items-start">
                                            <p class="card-text mb-auto">Austrian Center for Digital Humanities and Cultural Heritage</p>
                                        </div>
                                    </div>
                                </div>  
                               <div class="col-lg-6 col-md-6 col-sm-12">
                                    <div class="flex-md-row mb-4 align-items-center">
                                        <a href="https://acdh.oeaw.ac.at"><img class="card-img-right flex-auto d-md-block" src="https://fundament.acdh.oeaw.ac.at/common-assets/images/acdh_logo.svg" alt="ACDH Logo" style="max-width: 60px; height: auto;" title="ACDH Logo" /></a>
                                        <div class="card-body d-flex flex-column align-items-start">
                                            <p class="card-text mb-auto">Austrian Center for Digital Humanities and Cultural Heritage</p>
                                        </div>
                                    </div>
                                </div>                             
                            </div>
                        </div>
                    </div>
                    <!-- .footer-widget -->                       
                    <div class="footer-widget col-lg-3 col-md-4 col-sm-3 ml-auto">
                        <div class="row">
                            <div class="textwidget custom-html-widget">
                                <h6 class="font-weight-bold">HELPDESK</h6>
                                <p>ACDH-CH runs a helpdesk offering advice for questions related to various digital humanities topics.</p>
                                <p>
                                    <a class="helpdesk-button" href="mailto:acdh-helpdesk@oeaw.ac.at">ASK US!</a>
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="footer-widget col-lg-3 col-md-4 col-sm-3 ml-auto" style="margin-left:0 !important;">
                                <div class="textwidget custom-html-widget">
                                    <p style="margin-bottom:0 !important;">Social: </p>                                    
                                </div>
                                <div class="row">                              
                                    <div class="textwidget custom-html-widget col-md-4">                                    
                                        <a id="github-logo" title="GitHub" href="{$github_url}" class="nav-link" target="_blank">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24"><path d="M19 0h-14c-2.761 0-5 2.239-5 5v14c0 2.761 2.239 5 5 5h14c2.762 0 5-2.239 5-5v-14c0-2.761-2.238-5-5-5zm-4.466 19.59c-.405.078-.534-.171-.534-.384v-2.195c0-.747-.262-1.233-.55-1.481 1.782-.198 3.654-.875 3.654-3.947 0-.874-.312-1.588-.823-2.147.082-.202.356-1.016-.079-2.117 0 0-.671-.215-2.198.82-.64-.18-1.324-.267-2.004-.271-.68.003-1.364.091-2.003.269-1.528-1.035-2.2-.82-2.2-.82-.434 1.102-.16 1.915-.077 2.118-.512.56-.824 1.273-.824 2.147 0 3.064 1.867 3.751 3.645 3.954-.229.2-.436.552-.508 1.07-.457.204-1.614.557-2.328-.666 0 0-.423-.768-1.227-.825 0 0-.78-.01-.055.487 0 0 .525.246.889 1.17 0 0 .463 1.428 2.688.944v1.489c0 .211-.129.459-.528.385-3.18-1.057-5.472-4.056-5.472-7.59 0-4.419 3.582-8 8-8s8 3.581 8 8c0 3.533-2.289 6.531-5.466 7.59z"/></svg>                                
                                        </a>
                                    </div>                                                                        
                                </div>                                
                            </div>
                        </div>
                    </div>
                    <!-- .footer-widget -->
                </div>
            </div>
        </div>
        <!-- #wrapper-footer-full -->
        <div class="footer-imprint-bar" id="wrapper-footer-secondary" style="text-align:center; padding:0.4rem 0; font-size: 0.9rem;" >
            <a href="imprint.html">Impressum/Imprint</a>
        </div>
        <script type="text/javascript" src="dist/fundament/vendor/jquery/jquery.min.js"></script>
        <script type="text/javascript" src="dist/fundament/js/fundament.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.11.0/b-2.0.0/b-html5-2.0.0/cr-1.5.4/r-2.2.9/sp-1.4.0/datatables.min.js"></script>
        <script type="text/javascript" src="js/dt.js"></script>
    </xsl:template>
</xsl:stylesheet>