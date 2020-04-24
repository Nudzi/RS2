using AutoMapper;
using eProdaja.WebAPI.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eProdaja.WebAPI.Services
{
    public class BaseCRUDService<T, TSearch, TInsert, TUpdate, TDb> : BaseService<T, TSearch, TDb>, ICRUDService<T, TSearch, TInsert, TUpdate> where TDb : class
    {
        //First: base service from parent IService than IService for this class
        public BaseCRUDService(eProdajaContext context, IMapper mapper) : base(context, mapper)
        {
        }
        //we can user _mapper from BaseService, because there is already in constructor
        public virtual T Insert(TInsert request)
        {
            var entity = _mapper.Map<TDb>(request); //put what we need in TDb from some Insert
            _context.Add(entity); //add it to the base

            _context.SaveChanges(); // save it 

            return _mapper.Map<T>(entity); // and map it back to T for return
        }

        public T Update(int id, TUpdate request)
        {
            var entity = _context.Set<TDb>().Find(id);

            _mapper.Map(request, entity); //set my data to one I found for update that record

            _context.SaveChanges(); // save it 

            return _mapper.Map<T>(entity); // and map it back to T for return
        }
    }
}
