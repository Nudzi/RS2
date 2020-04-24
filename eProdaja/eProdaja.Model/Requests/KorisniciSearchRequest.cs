using System;
using System.Collections.Generic;
using System.Text;

namespace eProdaja.Model.Requests
{
    public class KorisniciSearchRequest
    {
        //we expand our Iservice
        public string Ime { get; set; }
        public string Prezime { get; set; }
    }
}
