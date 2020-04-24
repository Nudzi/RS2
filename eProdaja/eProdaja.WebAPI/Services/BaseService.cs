using AutoMapper;
using eProdaja.WebAPI.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eProdaja.WebAPI.Services
{
    public class BaseService<T, TSearch, TDb> : IService<T, TSearch> where TDb:class
    {
        protected eProdajaContext _context;
        protected IMapper _mapper;
        public BaseService(eProdajaContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public IList<T> Get(TSearch request = default)
        {
            var list = _context.Set<TDb>().ToList();
            //var list = _context.Korisnici.ToList();
            return _mapper.Map<IList<T>>(list);
        }
        public T GetById(int id)
        {
            var entity = _context.Set<TDb>().Find(id);
            return _mapper.Map<T>(entity);
        }
    }
}
