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

        public T AddOrGetExisting<T>(string key, Func<T> valueFactory)
        {
            var newValue = new Lazy<T>(valueFactory);
            var value = (Lazy<T>)cache.AddOrGetExisting(key, newValue, ObjectCache.InfiniteAbsoluteExpiration);
            return (value ?? newValue).Value;
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