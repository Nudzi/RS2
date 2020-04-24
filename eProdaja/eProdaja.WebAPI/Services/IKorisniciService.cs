using eProdaja.Model.Requests;
using eProdaja.WebAPI.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eProdaja.WebAPI.Services
{
    public interface IKorisniciService
    {
        List<Model.Korisnici> Get(KorisniciSearchRequest request);//from where we get the data <Model.Korisnici>
        Model.Korisnici GetById(int id);
        Model.Korisnici Insert(KorisniciInsertRequest korisnik);
        Model.Korisnici Update(int id, KorisniciUpdateRequest request);
    }
}
