<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdvErnMaintenance.aspx.cs" Inherits="docs_ErniukasSettingsNew" %>
<%@ register tagprefix="ex" namespace="Exact.Web.UI.Controls" assembly="Exact.Web.UI.Controls" %>

<html>
<head>
	<meta name="save" content="history" />
	<link runat="server" id="ExactCSS" href="Exact.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <ep:Form runat="server" ID="frmRoleMember">
	<ex:cardcontrol runat="server" id="Card" action="show">
		<ex:header runat="server" id="hdr">
			<ex:headerbutton id="hbFavorite" buttonstyle="Favorite" />
			<ex:headerbutton id="hbAddWidget" buttonstyle="AddWidget" />
			<ex:headerbutton id="hbHelp" buttonstyle="Help" />
		</ex:header>
		<ex:buttonbar runat="server" id="btnButtonBar">
			<ex:button runat="server" id="btnSave" buttonstyle="Save" datasource="bc" />
			<ex:button runat="server" id="btnDelete" buttonstyle="Delete" datasource="bc" onclick="SysSet('BCAction', 3); SysSubmit();" />
			<ex:button runat="server" id="btnClose" buttonstyle="Close" datasource="bc" />
		</ex:buttonbar>
		<ex:bcdatasource runat="server" id="bc" component="AdvErniukasBusiness"/>
		<ex:cardrow runat="server" id="Row1">
			<ex:cardcolumn runat="server" id="Col1">
				<ex:cardsection runat="server" id="csSec1" caption="  " ShowHeader=true>
                    <ex:cardfield runat="server" id="Cardfield1" caption="City" captionid="0">
                        <ex:inputField runat="server" id="InputField1" datafield="EventCity" datasource="bc"/>
					</ex:cardfield>
                    <ex:cardfield runat="server" id="Cardfield2" caption="Start Date" captionid="0">
                        <ex:inputField runat="server" id="InputField2" datafield="EventStartDate" datasource="bc"/>
					</ex:cardfield>
                    <ex:cardfield runat="server" id="Cardfield3" caption="End Date" captionid="0">
                        <ex:inputField runat="server" id="InputField3" datafield="EventEndDate" datasource="bc"/>
					</ex:cardfield>
				</ex:cardsection>
			</ex:cardcolumn>
		</ex:cardrow>
	</ex:cardcontrol>
    </ep:Form>
</body>
</html>
