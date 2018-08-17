<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ErniukasSettingsNew.aspx.cs" Inherits="docs_ErniukasSettingsNew" %>
<%@ Register TagPrefix="ex" Namespace="Exact.Web.UI.Controls" Assembly="Exact.Web.UI.Controls" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <title>Settings</title>
        <link runat="server" id="ExactCSS" href="Exact.css" type="text/css" rel="stylesheet" />
    </head>

    <body class="MenuPage">
        <form id="Form" runat="server">
            <ex:inputfield hidden="true" runat="server" id="Save" validationas="Boolean" />
            <ex:ButtonBar runat="server">
                <ex:Button ID="btnSave" runat="server" Caption="Save" ButtonStyle="Save" CaptionID="24522"  OnClick="SysSet('Save',true);SysSubmit(1);"/>
                <ex:Button runat="server" ID="btnClose" ButtonStyle="Close" />
            </ex:ButtonBar>

            <ex:BCErrorMessages ID="ErrMsg" Mode="Error" runat="server" />

            <ex:CardControl runat="server" Action="Show" Customizable="false">
                <ex:CardRow runat="server" Visible="true">
                    <ex:CardColumn runat="server">
                        <ex:CardSection runat="server" ID="csGeneral" Caption="General" Visible="true">
                            <ex:CardField ID="CardField2" runat="server" Caption="From email" CaptionID="666" DefaultMandatory="true">
                                <ex:InputField runat="server" ID="fromEmail" />
                            </ex:CardField>
                             <ex:CardField ID="CardField1" runat="server" Caption="SMTP server" CaptionID="666" DefaultMandatory="true">
                                <ex:InputField runat="server" ID="SMTP" />
                            </ex:CardField>
                             <ex:CardField ID="CardField3" runat="server" Caption="Port" CaptionID="666" DefaultMandatory="true">
                                <ex:InputField runat="server" ID="port" />
                            </ex:CardField>
                        </ex:CardSection>
                    </ex:CardColumn>
                </ex:CardRow>
            </ex:CardControl>

        </form>
    </body>

</html>

