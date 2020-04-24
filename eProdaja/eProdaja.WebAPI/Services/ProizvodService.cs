using eProdaja.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eProdaja.WebAPI.Services
{
    public class ProizvodService : IProizvodService
    {
        public IList<Proizvod> Get()
        {
            var list = new List<Proizvod>() {
            new Proizvod
            {
            Naziv = "Naziv1",
            ProizvodID = 1
            },
            new Proizvod
            {
                Naziv = "Naziv2",
            ProizvodID = 2
            }
            };

            return list;
        }
    }
}
