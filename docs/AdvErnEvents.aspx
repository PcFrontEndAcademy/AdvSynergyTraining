<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdvErnEvents.aspx.cs" Inherits="docs_ErniukasSettingsNew" %>
<%@ register tagprefix="ex" namespace="Exact.Web.UI.Controls" assembly="Exact.Web.UI.Controls" %>

<html>
<head>
	<link rel="stylesheet"  type="text/css" href ="Exact.css" />	
</head>
<body>
   <form id="frmRoles" runat="server">
		<ex:header id="hdrHeader" runat="server" >
			<ex:headerbutton id="hbExcel" buttonstyle="excelexport" />
			<ex:headerbutton id="hbPrint" buttonstyle="printable" />			
			<ex:headerbutton id="hbfavorite" buttonstyle="Favorite" />
			<ex:headerbutton id="hbAddWidget" buttonstyle="AddWidget" />
			<ex:headerbutton id="hbHelp" buttonstyle="Help" />
		</ex:header>

		<ex:search runat="server" id="Criteria" action="Show" layoutcolumns="2">
	       <ex:searchbuttons id="CriteriaButtons" runat="server" buttoncustomize="false">
				<ex:button runat="server" id="btnNew" buttonstyle="AddNew" navigateurl="AdvErnMaintenance.aspx?BCAction=0" />
			</ex:searchbuttons>
		</ex:search>

		<ex:listview runat="server" id="list" showwaitmessage="True" showpagesize="false"
            autopostback="True" onquery="OnQuery" ongetdata="OnGetData" enablesetting="true">
            <ex:listviewcolumn id="Name" caption="Name" enablesorting="true" captionid="0" align="Right" width="25%"/>
			<ex:listviewcolumn id="City" caption="City" enablesorting="true" captionid="0" width="25%"/>
			<ex:listviewcolumn id="StartDate" caption="Start Date" captionid="0" width="25%"/>
            <ex:listviewcolumn id="EndDate" caption="End Date" captionid="0" width="25%"/>
		</ex:listview>

		<ex:bcerrormessages runat="server" id="Err" />
   </form>
</body>
</html>
