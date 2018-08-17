using System;
using Exact.Common;
using Exact.Core;
using Exact.Data;
using Exact.Repository;

namespace AdvErniukasEvents
{
    public class EventValidation : IErcValidate, IErc
    {
        public DateTime EventStartDate { get; set; }
        public DateTime EventEndDate { get; set; }

        public string get_ValidationError(string PropName)
        {
            return "Start date must be lower than end date";
        }

        public void Init(Exact.Core.Environment Env, ERComponentRelationType RelationType, string RelationValue)
        {
        }

        public bool Validate(string PropName)
        {
            if(EventStartDate > EventEndDate)
            {
                return false;
            }

            return true;
        }
    }
}
