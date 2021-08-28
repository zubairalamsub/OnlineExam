using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineExam.Models
{
    public class Question
    {
        public int QSerialNo { get; set; }
        public string QText { get; set; }
        public string QSubject { get; set; }
        public float QNumber { get; set; }
        public int QType { get; set; }

    }
}