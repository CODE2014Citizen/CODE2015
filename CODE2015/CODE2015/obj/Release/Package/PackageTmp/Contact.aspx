<%@ Page Title="Contact PartnerIn.Work" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="CODE2015.Contact" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
         
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    	<div class="row" style="margin-left:10px;margin-right:10px">







			<!-- Article main content -->
			<article class="col-md-12 maincontent"  >


    <hgroup class="title">
        <h2>Contact the PartnerIn.Work CODE Hackathon Team</h2>
       
    </hgroup>

    <section class="contact">
        <p>
            <span class="label" style="color:black;font-size:17px;font-weight:bold;">CODE Team Page</span>
            <span><a class="siteLink" href="https://www.canadianopendataexperience.ca/teams/view/70">PartnerIn.Work</a></span>
        </p>
    </section>

    <section class="contact">
        <p>
            <span class="label" style="color:black;font-size:17px;font-weight:bold;">Email:</span>
            <span><a href="mailto:Code@PartnerIn.Work">Code@PartnerIn.Work</a></span>
        </p>
        
    </section>

    <section class="contact">
     
    </section>
                </article></div>
                

</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderScriptEnd" runat="server">
        <script>
            $("#NavLinkContact").attr('class', 'active');
    </script>
       </asp:Content>