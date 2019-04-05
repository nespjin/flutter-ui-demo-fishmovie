/*
 * Copyright (c) 2019  NESP Technology Corporation. All rights reserved.
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms and conditions of the GNU General Public License,
 * version 2, as published by the Free Software Foundation.
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License.See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * If you have any questions or if you find a bug,
 * please contact the author by email or ask for Issues.
 *
 * Author:JinZhaolu <1756404649@qq.com>
 */
part of home_page;

///
///
/// @team NESP Technology
/// @author <a href="mailto:1756404649@qq.com">靳兆鲁 Email:1756404649@qq.com</a>
/// @time: Created 19-4-2 下午2:52
/// @project fish_movie

class TabVideosPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TabVideosPageState();
  }
}

var _tabLoaded = false;
ScrollController _gridViewController = ScrollController();
int _totalPage = 5; //1000 pages in total
int _currentPage = 1;
int _pageNum = 12; //12 Video item in a page
bool _isRefresh = false;
bool _isLoadMore = false;

List<Video> _videos = List<Video>();

class _TabVideosPageState extends State<TabVideosPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadPageData();
    _gridViewController.addListener(() =>
        (_gridViewController.position.pixels ==
                _gridViewController.position.maxScrollExtent)
            ? loadMore()
            : () {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: MovieColors.movieWindowBackGround,
      child: _tabLoaded
          ? _ContentView(
              onRefresh: onRefresh,
            )
          : Loading(
              text: "正在加载",
            ),
    );
  }

  void loadMore() {
    //模拟加载更多
    if (_currentPage / _totalPage > 1 || _isLoadMore || _isRefresh) {
      //没有更多数据
      return;
    }
    _isLoadMore = true;
    NespToast.showShortToast('正在记载更多...');
    loadPageData().then((videos) {
      ++_currentPage;
      _isLoadMore = false;
      NespToast.showShortToast('加载成功');
    });
  }

  void onLoadFailed() {
    //模拟加载失败，在此不考虑
  }

  Future<void> onRefresh() {
    if (_isLoadMore || _isRefresh) return Future.delayed(Duration(seconds: 0));
    //模拟刷新
    _videos.clear();
    return loadPageData().then((videos) {
      NespToast.showShortToast('刷新成功');
    });
  }

  Future<List<Video>> loadPageData() async {
    //初始化首页Video数据
    for (int i = 0; i < _pageNum / 4; i++) {
      _videos.add(Video(
          status: '电影',
          score: '7.0',
          name: '惊奇队长',
          coverImgUrl:
              'https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3524261799,1274342290&fm=58&s=617A3FC7637287CC56C98C9E0300A0C3'));

      _videos.add(Video(
          status: '电影',
          score: '8.9',
          name: '绿皮书',
          coverImgUrl:
              'https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=879858123,1250085668&fm=58&s=9B9144840E1A6ECE0936D6410300D0F9'));

      _videos.add(Video(
          status: '电影',
          score: '7.9',
          name: '白蛇:缘起',
          coverImgUrl:
              'https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3005648577,4229979128&fm=58&s=1784DE0444A2D6FE54347CC40300A0B2'));

      _videos.add(Video(
          status: '电影',
          score: '6.0',
          name: '爱在前方',
          coverImgUrl:
              'https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=768873779,3067383930&fm=58&s=B9A9DB14075265D4108449C4030070EB'));
    }

    //模拟网络阻塞
    await Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _tabLoaded = true;
      });
    });

    return _videos;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

typedef RefreshCallback = Future<void> Function();

class _ContentView extends StatelessWidget {
  final RefreshCallback onRefresh;

  const _ContentView({Key key, this.onRefresh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RefreshIndicator(
        child: GridView.count(
            controller: _gridViewController,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            crossAxisCount: 3,
            padding: EdgeInsets.all(10),
            children: _videos
                .map((video) => _VideoItem(
                      video: video,
                    ))
                .toList()),
        onRefresh: onRefresh);
  }
}

class _VideoItem extends StatelessWidget {
  final Video video;

  const _VideoItem({Key key, this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(),
      child: GestureDetector(
        onTap: () {
          Scaffold.of(context).showSnackBar(SnackBar(
            duration: Duration(seconds: 2),
            content:
                Text('点击了 ${video.name} at item ${_videos.indexOf(video)} '),
          ));
        },
        child: SizedBox(
            height: 100,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: <Widget>[
                      FadeInImage.assetNetwork(
                          fit: BoxFit.fill,
                          height: 150,
                          width: 121,
                          placeholder: 'assets/images/img_loading_bg.webp',
                          image: video.coverImgUrl),
                      Container(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        color: Color(0xaab7b7b7),
                        child: Text(
                          video.status,
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                      ),
                      Positioned(
                        top: 135,
                        child: Container(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          color: Color(0xaab7b7b7),
                          child: Text(
                            video.score,
                            style: TextStyle(fontSize: 13, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(video.name)
                ])),
      ),
    );
  }
}
