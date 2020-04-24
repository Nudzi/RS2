using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eProdaja.WebAPI.Services
{
    public interface IService<T, TSearch>
    {
        IList<T> Get(TSearch search = default(TSearch));
        T GetById(int id);
    }
}
