import 'package:flutter/material.dart';
import 'package:my_flutter/common/localization/default_localizations.dart';
import 'package:my_flutter/common/style/saint_style.dart';
import 'package:my_flutter/common/utils/common_utils.dart';
import 'package:share/share.dart';

class SaintCommonOptionWidget extends StatelessWidget {
  final List<GSYOptionModel>? otherList;

  final String? url;

  const SaintCommonOptionWidget({Key? key, this.otherList, String? url})
      : url = (url == null) ? GSYConstant.app_default_share_url : url, super(key: key);

  _renderHeaderPopItem(List<GSYOptionModel> list) {
    return  PopupMenuButton<GSYOptionModel>(
      child: const Icon(SaintICons.MORE),
      onSelected: (model) {
        model.selected(model);
      },
      itemBuilder: (BuildContext context) {
        return _renderHeaderPopItemChild(list);
      },
    );
  }

  _renderHeaderPopItemChild(List<GSYOptionModel> data) {
    List<PopupMenuEntry<GSYOptionModel>> list = [];
    for (GSYOptionModel item in data) {
      list.add(PopupMenuItem<GSYOptionModel>(
        value: item,
        child: Text(item.name),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    List<GSYOptionModel> constList = [
       GSYOptionModel(SaintLocalizations.i18n(context)!.option_web,
          SaintLocalizations.i18n(context)!.option_web, (model) {
        CommonUtils.launchOutURL(url, context);
      }),
       GSYOptionModel(SaintLocalizations.i18n(context)!.option_copy,
          SaintLocalizations.i18n(context)!.option_copy, (model) {
        CommonUtils.copy(url ?? "", context);
      }),
       GSYOptionModel(SaintLocalizations.i18n(context)!.option_share,
          SaintLocalizations.i18n(context)!.option_share, (model) {
        Share.share(
            SaintLocalizations.i18n(context)!.option_share_title + (url ?? ""));
      }),
    ];
    var list = [...constList, ...?otherList];
    return _renderHeaderPopItem(list);
  }
}

class GSYOptionModel {
  final String name;
  final String value;
  final PopupMenuItemSelected<GSYOptionModel> selected;

  GSYOptionModel(this.name, this.value, this.selected);
}
