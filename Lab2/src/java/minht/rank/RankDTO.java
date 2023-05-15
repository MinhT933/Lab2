/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minht.rank;

/**
 *
 * @author MinhT
 */
public class RankDTO {
     private int rankID, rankValue;

    public RankDTO(int rankID, int rankValue) {
        this.rankID = rankID;
        this.rankValue = rankValue;
    }

    @Override
    public String toString() {
        return "RankDTO{" + "rankID=" + rankID + ", rankValue=" + rankValue + '}';
    }

    public int getRankID() {
        return rankID;
    }

    public void setRankID(int rankID) {
        this.rankID = rankID;
    }

    public int getRankValue() {
        return rankValue;
    }

    public void setRankValue(int rankValue) {
        this.rankValue = rankValue;
    }

    
}
