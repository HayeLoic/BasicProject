using System;
using System.Runtime.Caching;

namespace BasicProject.DataAccess.Cache
{
    public class MemoryCacheService : IMemoryCacheService
    {
        private readonly ObjectCache cache;

        public MemoryCacheService()
        {
            cache = MemoryCache.Default;
        }

        public T Get<T>(string cacheId)
        {
            T item = default(T);
            if (cache.Get(cacheId) != null)
            {
                item = (T)cache.Get(cacheId);
            }

            return item;
        }

        public T AddOrGetExisting<T>(string key, Func<T> valueFactory, TimeSpan expiration)
        {
            var value = this.Get<T>(key);
            if (value == null)
            {
                var newValue = valueFactory();
                this.InsertCache(key, newValue, expiration);
                return newValue;
            }
            return value;
        }

        public T InsertCache<T>(string key, T objectToCache, TimeSpan expiration)
        {
            if (cache.Get(key) != null)
            {
                cache.Remove(key);
            }
            CacheItemPolicy policy = new CacheItemPolicy
            {
                AbsoluteExpiration = DateTimeOffset.Now.Add(expiration),
            };
            cache.Set(key, objectToCache, policy);
            return objectToCache;
        }

        public void Clear()
        {
            foreach (var element in MemoryCache.Default)
            {
                MemoryCache.Default.Remove(element.Key);
            }
        }
    }
}