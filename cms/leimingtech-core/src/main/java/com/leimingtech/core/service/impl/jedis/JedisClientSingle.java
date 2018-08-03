package com.leimingtech.core.service.impl.jedis;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import com.leimingtech.core.service.jedis.JedisClient;
import com.leimingtech.core.util.SerializationUtil;

/**
 * 单机版的jedis客户端操作
 * 
 * @author liuzhen
 * 
 */
public class JedisClientSingle implements JedisClient {

	@Autowired
	private JedisPool jedisPool;

	@Override
	public String set(String key, String value) {
		if(!JedisConfig.JEDIS_STATUS){
			return null;
		}
		Jedis jedis = jedisPool.getResource();
		String result = jedis.set(key, value);
		jedis.close();
		return result;
	}

	@Override
	public <V> String set(String key, V value) {
		if(!JedisConfig.JEDIS_STATUS){
			return null;
		}

		SerializationUtil.checkSerializable(value);

		Jedis jedis = jedisPool.getResource();
		String result = jedis.set(key.getBytes(), SerializationUtil.serialize(value));
		jedis.close();
		return result;
	}

	@Override
	public String get(String key) {
		if(!JedisConfig.JEDIS_STATUS){
			return null;
		}
		Jedis jedis = jedisPool.getResource();
		String result = jedis.get(key);
		jedis.close();
		return result;
	}

	@Override
	public Long del(String key) {
		if(!JedisConfig.JEDIS_STATUS){
			return null;
		}

		Jedis jedis = jedisPool.getResource();
		Long result=jedis.del(key);
		return result;
	}

	@Override
	public <T> T get(String key, Class<T> classs) {

		if (!JedisConfig.JEDIS_STATUS) {
			return null;
		}
		Jedis jedis = jedisPool.getResource();
		byte[] result = jedis.get(key.getBytes());

		jedis.close();
		if (result != null) {
			return (T) SerializationUtil.deserialize(result);
		}
		return null;
	}

	@Override
	public <T> List<T> getList(String key, Class<T> classs) {
		if (!JedisConfig.JEDIS_STATUS) {
			return null;
		}
		Jedis jedis = jedisPool.getResource();
		byte[] result = jedis.get(key.getBytes());
		jedis.close();
		if (result != null) {
			return (List<T>) SerializationUtil.deserialize(result);
		}
		return null;
	}

	@Override
	public Long hset(String key, String item, String value) {
		if(!JedisConfig.JEDIS_STATUS){
			return null;
		}
		Jedis jedis = jedisPool.getResource();
		Long result = jedis.hset(key, item, value);
		jedis.close();
		return result;
	}

	@Override
	public <V> Long hset(String key, String item, V value) {
		if(!JedisConfig.JEDIS_STATUS){
			return null;
		}
		SerializationUtil.checkSerializable(value);
		try {
			Jedis jedis = jedisPool.getResource();
			Long result = jedis.hset(key.getBytes("UTF-8"), item.getBytes("UTF-8"),
					SerializationUtil.serialize(value));
			jedis.close();
			return result;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String hget(String key, String item) {
		if(!JedisConfig.JEDIS_STATUS){
			return null;
		}
		Jedis jedis = jedisPool.getResource();
		String result = jedis.hget(key, item);
		jedis.close();
		return result;
	}

	/**
	 * 根据key获取序列化数据
	 *
	 * @param key    缓存key
	 * @param item
	 * @param classs 需要反序列出的对象
	 * @return
	 */
	@Override
	public <T> T hget(String key, String item, Class<T> classs) {
		if(!JedisConfig.JEDIS_STATUS){
			return null;
		}
		Jedis jedis = jedisPool.getResource();

		try {
			byte[] result = jedis.hget(key.getBytes("UTF-8"), item.getBytes("UTF-8"));
			jedis.close();
			return (T) SerializationUtil.deserialize(result);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}

	}

	@Override
	public Long hdel(String key, String item) {
		if(!JedisConfig.JEDIS_STATUS){
			return null;
		}
		Jedis jedis = jedisPool.getResource();
		Long result = jedis.hdel(key, item);
		jedis.close();
		return result;
	}

	@Override
	public Long incr(String key) {
		if(!JedisConfig.JEDIS_STATUS){
			return null;
		}
		Jedis jedis = jedisPool.getResource();
		Long result = jedis.incr(key);
		jedis.close();
		return result;
	}

	@Override
	public Long decr(String key) {
		if(!JedisConfig.JEDIS_STATUS){
			return null;
		}
		Jedis jedis = jedisPool.getResource();
		Long result = jedis.decr(key);
		jedis.close();
		return result;
	}

	@Override
	public Long expire(String key, int second) {
		if(!JedisConfig.JEDIS_STATUS){
			return null;
		}
		Jedis jedis = jedisPool.getResource();
		Long result = jedis.expire(key, second);
		jedis.close();
		return result;
	}

	@Override
	public Long ttl(String key) {
		if(!JedisConfig.JEDIS_STATUS){
			return null;
		}
		Jedis jedis = jedisPool.getResource();
		Long result = jedis.ttl(key);
		jedis.close();
		return result;
	}

	/**
	 * 加入到缓存并自动设置默认缓存时间
	 *
	 * @param key
	 * @param value
	 */
	@Override
	public <V> void setEX(String key, V value) {
		if (!JedisConfig.JEDIS_STATUS || value == null) {
			return;
		}

		SerializationUtil.checkSerializable(value);
		Jedis jedis = jedisPool.getResource();
		jedis.psetex(key.getBytes(), JedisConfig.JEDIS_DEFAULT_EXPIRE * 1000, SerializationUtil.serialize(value));
	}

	/**
	 * 是否存在缓存
	 *
	 * @param key
	 * @return
	 */
	@Override
	public boolean exists(String key) {
		if (!JedisConfig.JEDIS_STATUS) {
			return Boolean.FALSE;
		}

		Jedis jedis = jedisPool.getResource();
		return jedis.exists(key);
	}

	/**
	 * 加入到集合头
	 *
	 * @param key
	 * @param value
	 * @return 返回整树，操作后集合中的数量
	 */
	@Override
	public long lpush(String key, String... value) {
		if (!JedisConfig.JEDIS_STATUS) {
			return 0;
		}
		Jedis jedis = jedisPool.getResource();
		return jedis.lpush(key,value);
	}

	/**
	 * 加入到集合尾
	 *
	 * @param key
	 * @param value
	 * @return 返回整树，操作后集合中的数量
	 */
	@Override
	public long rpush(String key, String... value) {
		if (!JedisConfig.JEDIS_STATUS) {
			return 0;
		}
		Jedis jedis = jedisPool.getResource();
		return jedis.rpush(key,value);
	}

	/**
	 * jedis.llen获取长度 -1表示取得所有
	 *
	 * @param key
	 * @param startIndex 起始位置，从0开始
	 * @param endIndex   结束位置，jedis.llen获取长度 -1表示取得所有
	 * @return
	 */
	@Override
	public List<String> lrange(String key, int startIndex, int endIndex) {
		if (!JedisConfig.JEDIS_STATUS) {
			return null;
		}
		Jedis jedis = jedisPool.getResource();
		return jedis.lrange(key, startIndex, endIndex);
	}

	/**
	 * 加入到集合尾
	 *
	 * @param key
	 * @param value
	 * @return 返回整树，操作后集合中的数量
	 */
	@Override
	public long rpushEX(String key, String value) {
		if (!JedisConfig.JEDIS_STATUS) {
			return 0;
		}
		Jedis jedis = jedisPool.getResource();
		long count = jedis.rpush(key, value);
		jedis.expire(key, (int) JedisConfig.JEDIS_DEFAULT_EXPIRE);
		return count;
	}

	/**
	 * 向Set添加一条记录
	 *
	 * @param key
	 * @param value
	 * @return 如果value已存在返回0, 否则返回1
	 */
	@Override
	public long sadd(String key, String value) {
		if (!JedisConfig.JEDIS_STATUS) {
			return 0;
		}
		Jedis jedis = jedisPool.getResource();
		return jedis.sadd(key, value);
	}

	/**
	 * 返回set集合中的所有成员
	 *
	 * @param key
	 * @return
	 */
	@Override
	public Set<String> smembers(String key) {
		if (!JedisConfig.JEDIS_STATUS) {
			return null;
		}
		Jedis jedis = jedisPool.getResource();
		return jedis.smembers(key);
	}

	@Override
	public Map<String, String> hgetAll(String key) {
		if (!JedisConfig.JEDIS_STATUS) {
			return null;
		}
		Jedis jedis = jedisPool.getResource();
		return jedis.hgetAll(key);
	}
}