using AutoMapper;
using eProdaja.Model.Requests;
using eProdaja.WebAPI.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eProdaja.WebAPI.Services
{
    public class KorisniciService : IKorisniciService
    {
        private readonly eProdajaContext _context;
        private readonly IMapper _mapper;
        public KorisniciService(eProdajaContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public List<Model.Korisnici> Get(KorisniciSearchRequest request)
        {
            var query = _context.Korisnici.AsQueryable();
            if (!string.IsNullOrWhiteSpace(request?.Ime))
            {
                query = query.Where(x => x.Ime.StartsWith(request.Ime));
            }
            if (!string.IsNullOrWhiteSpace(request?.Prezime))
            {
                query = query.Where(x => x.Prezime.StartsWith(request.Prezime));
            }
            var list = query.ToList();
            //var list = _context.Korisnici.ToList();
            return _mapper.Map<List<Model.Korisnici>>(list);
        }

        public Model.Korisnici GetById(int id)
        {
            var entity = _context.Korisnici.Find(id);
            return _mapper.Map<Model.Korisnici>(entity);

        }

        public Model.Korisnici Insert(KorisniciInsertRequest korisnik)
        {
            var entity = _mapper.Map<Database.Korisnici>(korisnik);
            if (korisnik.Password != korisnik.PasswordConfrimation)
                throw new Exception("Password is not the same!");
            entity.LozinkaHash = "test";
            entity.LozinkaSalt = "test";

            _context.Korisnici.Add(entity);
            _context.SaveChanges();
            return _mapper.Map<Model.Korisnici>(entity);
        }

        public Model.Korisnici Update(int id, KorisniciUpdateRequest request)
        {
            var entity = _context.Korisnici.Find(id); //get user

            _mapper.Map(request, entity); //transfer in model from database

            //if (!string.IsNullOrWhiteSpace(request.Password)) //check pass, if passe exist
            //{
            //    if (request.Password != request.PasswordConfrimation) //check similarity
            //        throw new Exception("Password is not the same!");
            //}
            _context.SaveChanges(); //save it
            return _mapper.Map<Model.Korisnici>(entity);//return our model, than go to controller
        }
    }
}
 