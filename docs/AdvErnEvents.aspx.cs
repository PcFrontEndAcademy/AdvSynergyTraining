using System;
using Exact.Web.UI.Controls;
using Exact.Data;
using ExactHelpers.Extensions;

public partial class docs_ErniukasSettingsNew : Exact.Web.UI.Page.Base
{
    private enum Fields
    {
        Name,
        City,
        StartDate,
        EndDate
    }
    protected void Page_Load(){
        list.Paging.Value = 5;
    }

    protected void OnQuery(object sender, EventArgs e)
    {
        ListView list = (ListView)sender;
        var query = new QueryBuilder(conn)
        {
            Top = list.PageSize,
            Select = "*",
            From = "AdvEvents"
        };

        query.AppendSort<Fields>(list); 

        list.Data = (object[,])conn.Query(query);
    }

    protected void OnGetData(object sender, EventArgs e)
    {
        if(list.Data != null && list.Data.Length > 0)
        {
            for (int i = 0; i < list.Data.GetLength(0); i++)
            {
                list.RowStart();
                list.RowCellRef(GetPropertyValue(list.Data, i, Fields.Name), "AdvErnMaintenance.aspx?BCAction=1&EventName=" + GetPropertyValue(list.Data, i, Fields.Name));
                list.RowCell(GetPropertyValue(list.Data, i, Fields.City));
                list.RowCell(GetPropertyValue(list.Data, i, Fields.StartDate));
                list.RowCell(GetPropertyValue(list.Data, i, Fields.EndDate));

                list.RowEnd();
            }
        }
    }

    private string GetPropertyValue(object[,] data, int index, Fields fieldName)
    {
        var value = data[index, (int)fieldName];
        return value != null ? value.ToString() : null;
    }
}