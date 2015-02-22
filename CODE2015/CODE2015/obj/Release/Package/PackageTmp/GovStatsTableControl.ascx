<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GovStatsTableControl.ascx.cs" Inherits="CODE2015.GovStatsTableControl" ClientIDMode="AutoID" %>


<asp:HiddenField ID="HiddenFieldRegion" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="HiddenFieldCity" runat="server" ClientIDMode="Static" />

<style>
    

</style>
<asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
 <div  style="margin-bottom:20px;position:relative;width:100%;height:100%">
                
     <div class="tabInnerHeading">
         <div style="height:auto;margin-left:5px;margin-right:5px; border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #0000FF;">
             <div style="float: left;padding-bottom:3px;width:400px;font-size:19px;">Government Employment Statistics for:</div>
             <div style="float: left;border-style: solid; border-width: 1px; border-color: #EAEAEA #EAEAEA #A6A6A0 #EAEAEA; background-color:#EBFFDF;padding-right:0px;">
                 <asp:TextBox ID="TextBoxStatsLocation" Width="410" runat="server" ClientIDMode="Static" ReadOnEBFFDFly="True" BackColor="#EBFFDF" BorderColor="#EBFFDF"></asp:TextBox>

                 </div>
             <div class="spacer" style="clear: both;"></div>
             <div>
                 <div style="float: left;">Seasonally Adjusted <asp:CheckBox ID="CheckBoxSeasonalAdjust" runat="server" Text=""    ClientIDMode="Static" /></div>
                 <div style="float: left;margin-left:20px">Start Date:<asp:TextBox ID="TextBoxStartDate" runat="server" Width="120" ClientIDMode="Static"></asp:TextBox>
                 End Date:<asp:TextBox ID="TextBoxEndDate" runat="server" Width="120" ClientIDMode="Static"></asp:TextBox></div>
                
                 <asp:LinkButton style="color:white;" ID="LinkButtonRefresh" ClientIDMode="Static" OnClientClick="statsRefresh();" OnClick="ButtonRefresh_Click" runat="server" CssClass="badge">Refresh</asp:LinkButton>
             <div class="spacer" style="clear: both;">
             </div>
         </div>
                  <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server"  TargetControlID="TextBoxStartDate" DefaultView="Months"></ajaxToolkit:CalendarExtender>
         <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="TextBoxEndDate" DefaultView="Months"></ajaxToolkit:CalendarExtender>
        
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
                    <td><%# DataBinder.Eval(Container.DataItem, "RefDate", "{0:MM/dd/yyyy}") %></td>
                </tr>
            </ItemTemplate>



        </asp:Repeater>
           

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
  
     </div>
    </ContentTemplate>

</asp:UpdatePanel>