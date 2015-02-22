<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GovStatsTableControl.ascx.cs" Inherits="CODE2015.GovStatsTableControl" %>


<asp:HiddenField ID="HiddenFieldRegionID" runat="server" />
<asp:HiddenField ID="HiddenFieldCity" runat="server" />

<style>
    

</style>

 <div  style="margin-bottom:20px;position:relative;width:100%;height:100%">
                
     <div class="tabInnerHeading">
         <div style="height:auto;margin-left:5px;margin-right:5px; border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #0000FF;">
             <div style="float: left;padding-bottom:3px;width:400px;font-size:19px;">Government Employment Statistics for:</div>
             <div style="float: left;border-style: solid; border-width: 1px; border-color: #EAEAEA #EAEAEA #A6A6A0 #EAEAEA; background-color:#EBFFDF;padding-right:40px;">
             
                 <asp:Label ID="LabelStatsLocation" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                 </div>
             <div class="spacer" style="clear: both;"></div>
         </div>
                 
        
     </div>
    <table id="tableStats">
        <thead>
        <tr>
            <th>Characteristic</th>
            <th>Value</th>
            <th>Date</th>
        </tr>
            </thead>
        <tbody>
        <asp:Repeater ID="RepeaterLabourForceSurveyEstimates" runat="server">

            <ItemTemplate>
                <tr>
                    <td><%# DataBinder.Eval(Container.DataItem, "Characteristic") %> </td>
                    <td><%# DataBinder.Eval(Container.DataItem, "Value") %></td>
                    <td><%# DataBinder.Eval(Container.DataItem, "RefDate") %></td>
                </tr>
            </ItemTemplate>



        </asp:Repeater>
             <tr>
                    <td>Persons Employed</td>
                    <td>?</td>
                    <td>?</td>
                </tr>
            <tr>
                    <td>Average Wage</td>
                    <td>?</td>
                    <td>?</td>
                </tr>
            <tr>
                    <td>Unemployment Rate</td>
                    <td>?</td>
                    <td>?</td>
                </tr>
        </tbody>




    </table>
 

        <div id="StatsLoading" style="visibility: hidden;background-color:rgba(00,00,00,0.6);position:absolute;left:0; right:0;top:0;bottom:0;z-index:100;text-align:center;vertical-align:middle;display: table-cell;">
            <div style="border: medium outset #0000FF; background-color:white; width:160px; margin-top:50px; margin-left:auto; margin-right:auto; height:140px; text-align:center; font-size: 20px; font-weight: bold;">
            Updating<br />
                <img width="75" src="Images/loading-animation.gif"  />
                Please Wait
                </div>
     </div>

    </div>
  

 