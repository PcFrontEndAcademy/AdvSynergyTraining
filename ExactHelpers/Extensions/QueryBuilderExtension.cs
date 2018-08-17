using Exact.Data;
using Exact.Web.UI.Controls;
using System;

namespace ExactHelpers.Extensions
{
    public static class QueryBuilderExtension
    {
        public static QueryBuilder AppendSort<T>(this QueryBuilder query, ListView list)
            where T : IConvertible
        {
            if (!typeof(T).IsEnum)
            {
                throw new ArgumentException("T must be an enumerated type");
            }

            var values = Enum.GetValues(typeof(T));

            foreach (var value in values)
            {
                if (value.ToString() == list.SortColumn)
                {
                    query.AppendOrderBy(value.ToString(), list.SortDescending);
                }
            }
            return query;
        }
    }
}
