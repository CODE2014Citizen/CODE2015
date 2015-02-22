<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CODE2015._Default" ClientIDMode="Predictable" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/GovStatsTableControl.ascx" TagPrefix="uc1" TagName="GovStatsTableControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
         <style>
             .mapOuterBox
             {
                 background-image: linear-gradient(to top, #fff 0%, #f8f8f8 100%);
                 padding: 20px;
                 border: 2px solid #e7e7e7;
                 -webkit-border-radius: 20px;
                 -moz-border-radius: 20px;
                 border-radius: 20px;
             }
             

             .mapInnerBox
             {
                 border: 2px solid #e7e7e7;
             }


         </style>



</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    
    	<div class="row" style="margin-left:10px;margin-right:10px">







			<!-- Article main content -->
			<article class="col-md-12 maincontent"  >


    <div class="row mapOuterBox" >
  <div class="span9 mapInnerBox" style="height:500px;">

      <div id="map" style="height:100%"></div>

  </div>
</div>

    <div style="margin-top:15px;">
        <asp:TextBox ID="TextBoxLocation" runat="server" placeholder="Location" Width="100%" ClientIDMode="Static" onkeypress="return checkLocationInputReady(event)"></asp:TextBox>

    </div>

    <div style="margin-top:20px;position:relative;width:100%;height:100%">

        <style>


</style>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional"><ContentTemplate>
        <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" 
        OnClientActiveTabChanged="ClientFunction" 
        CssClass="ajax__tab_CODE-theme" TabIndex="1" ActiveTabIndex="2">
    
            <ajaxToolkit:TabPanel ID="TabPanelWork" runat="server" HeaderText="Work">
        <ContentTemplate>
    
        </ContentTemplate>
       </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="TabPanelWorkers" runat="server" HeaderText="Workers">
        <ContentTemplate>
    
        </ContentTemplate>
       </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="TabPanelStats" runat="server" HeaderText="Work Stats">
        <ContentTemplate>
            <uc1:GovStatsTableControl runat="server" ID="GovStatsTableControl" />
    
        </ContentTemplate>
       </ajaxToolkit:TabPanel>


            </ajaxToolkit:TabContainer>
              <asp:Button ID="ButtonAddressChange" runat="server" Text="" OnClick="Button1_Click" ClientIDMode="Static" style="display:none" />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ButtonAddressChange" />

            </Triggers>

        </asp:UpdatePanel>

      

    </div>
                </article></div>

</asp:Content>





<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderScriptEnd" runat="server">
        <script>
            $("#NavLinkHome").attr('class', 'active');
    </script>

    	<script src="https://maps.googleapis.com/maps/api/js?key=&amp;sensor=false&amp;extension=.js"></script> 
    <script src="/Scripts/GoogleMap.js"></script>

       <script type="text/javascript">

           $(document).ready(function () {

               var pTable = $('#tableStats').dataTable()
           });


           Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
           function EndRequestHandler(sender, args) {
               if (args.get_error() == undefined) {
                   pTable = $('#tableStats').DataTable();
               }
           }


</script>

        <script type="text/javascript">
            $("#TextBoxLocation").focusout(
    function () {
        $(this).toggleClass("active", false);
    }
    );

            function checkLocationInputReady (event) {
                if (event.which == 13 || event.keyCode == 13) {
                    //code to execute here
                    addressTextChanged(document.getElementById('TextBoxLocation').value);
                    return false;
                }
                return true;
            };

            
    </script>

       </asp:Content>