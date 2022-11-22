import 'package:avenue/presentation/UI/checkout/components/checkout_textfield.dart';
import 'package:flutter/material.dart';
import 'package:avenue/logic/blocs/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../util/dimensions.dart';
import '../../widgets/textfield.dart';

class CheckoutBody extends StatelessWidget {
  const CheckoutBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Dimensions dimensions=Dimensions(context: context);

    return Container(
      margin: EdgeInsets.only(
          left: dimensions.horizontalPadding30,
          right: dimensions.horizontalPadding30,
          top: dimensions.verticalPadding30,),

      child: BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if(state is CheckoutLoading){
            return const Center(
              child: Text("something is not okay"),
            );
          }
          if (state is CheckoutLoaded) {
           return SingleChildScrollView(
             child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  CheckoutTextField(
                    label: "Full name",
                    child: AvenueTextField(
                      onChanged:(value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(fullName: value));} ,),),

                  CheckoutTextField(
                    label: "Address",
                    child: AvenueTextField(
                      hintText: "Hall 6 room 25 ",
                      onChanged:(value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(address: value));} ,),),

                  CheckoutTextField(
                    label: "City",
                    child: AvenueTextField(
                      hintText: "Thyolo",
                      onChanged:(value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(city: value));} ,),),

                  CheckoutTextField(
                    label: "Country",
                    child: AvenueTextField(
                      hintText: "Malawi",
                      onChanged:(value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(country: value));} ,),),





                ],
             ),
           );
          }

          else{

            return const Text("");

          }
    },
      ),
    );
  }
}
