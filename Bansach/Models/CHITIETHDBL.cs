//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Bansach.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class CHITIETHDBL
    {
        public int Idsach { get; set; }
        public int Idhdbl { get; set; }
        public string Giaban { get; set; }
        public Nullable<int> Soluong { get; set; }
        public string Thanhtien { get; set; }
    
        public virtual HOADONBANLE HOADONBANLE { get; set; }
        public virtual SACH SACH { get; set; }
    }
}
