import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:amotionflutterui/color/color.dart';
import 'package:amotionflutterui/model/station_info.dart';

class RecommendList extends StatelessWidget {
  final StationInfo data;
  final Function(StationInfoItem) itemClick;

  RecommendList({this.data, this.itemClick});

  Widget _buildItem(StationInfoItem item) {
    return GestureDetector(
      child: Card(
        color: colorFFFFFF,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: InkWell(
          onTap: itemClick(item),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  item.pic,
                  fit: BoxFit.contain,
                  width: 100,
                  height: 100,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        item.address,
                        style: TextStyle(
                          fontSize: 14,
                          color: color999999,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "" + item.travel.toString() + "km",
                        style: TextStyle(
                          color: color999999,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Text(
                        "￥" + item.newPrice.toString(),
                        style: TextStyle(color: colorF2270C, fontSize: 14),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "油站价￥" + item.price.toString(),
                        style: TextStyle(
                            color: color999999,
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough // 主要是用到了这个属性
                            ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      //实现边框
                      border: Border.all(
                        color: color999999,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(5), //边框的角度
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, top: 2.0, right: 8.0, bottom: 2.0),
                      child: Text(
                        '0#不可用',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return data.data == null
        ? Container()
        : ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: data.data.length,
            itemBuilder: (context, index) => _buildItem(data.data[index]));
  }
}
