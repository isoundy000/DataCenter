package com.dao.gameRecord.mapper;

import java.util.List;
import java.util.Map;

import com.pojo.GameRecord;

public interface GameRecordMapper {
	public List<GameRecord> findGameRecordByID(int roomId);
	public List<GameRecord> getGameRecordsByPlayerId(Map<String, Object> paramMap);
}
