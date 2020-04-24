using AutoMapper;
using eProdaja.Model.Requests;
using eProdaja.WebAPI.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eProdaja.WebAPI.Mappers
{
    //include it in service from what data you are mapping, in this case it is korisniciService
    public class Mapper : Profile // profile is from automapper
    {
        public Mapper()
        {
            CreateMap<Database.Korisnici, Model.Korisnici>();//<from what, to what> data you are mapping
            CreateMap<Database.Korisnici, KorisniciInsertRequest>().ReverseMap();//mapping reverse, from both sides
            CreateMap<KorisniciUpdateRequest, Korisnici>(); // means you want to map from User to UserDTO

            CreateMap<Uloge, Model.Uloge>();
            CreateMap<VrsteProizvoda, Model.VrsteProizvoda>();
            CreateMap<JediniceMjere, Model.JediniceMjere>();
            CreateMap<Proizvodi, Model.Proizvodi>();
            CreateMap<ProizvodiInsertRequest, Proizvodi>();
            CreateMap<ProizvodUpdateRequest, Proizvodi>();
        }
    }
}
